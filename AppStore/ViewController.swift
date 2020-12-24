import UIKit


class ViewController: UICollectionViewController {
    
    private let indicatorContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .systemPink
        v.setDimension(width: 72, height: 72)
        v.layer.cornerRadius = 4
        return v
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let i = UIActivityIndicatorView(style: .large)
        i.color = .label
        return i
    }()
    
    init() {
        let layout = FlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var apps = [Categories]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.hidesWhenStopped = true
                self?.indicatorContainer.removeFromSuperview()
                guard let self = self else { return }
                
                
                self.collectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(HeaderContainer.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(CoursesCellContainer.self , forCellWithReuseIdentifier: CoursesCellContainer.cellId)
        #warning("We'll deal with that later on")
        setupIndicator()
                AppStoreService.shared.fetchData { res  in
                    switch res {
                    case .success(let appStoreData):
                        self.apps = appStoreData.categories
                    case .failure(let e):
                        print("Error happend \(e.localizedDescription)")
                    }
                }
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        //        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPurple]
        
    }
    
    fileprivate func setupIndicator() {
        view.addSubview(indicatorContainer)
        indicatorContainer.addSubview(activityIndicator)
        indicatorContainer.center(inView: view)
        activityIndicator.center(inView: indicatorContainer)
        activityIndicator.startAnimating()
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCellContainer.cellId, for: indexPath)
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind , withReuseIdentifier: "header", for: indexPath)
        header.backgroundColor = .systemYellow
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 340)
    }
}


class HeaderContainer: UICollectionReusableView {
    private let container = TableForMemeberView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        //        container.backgroundColor = .orange
        container.setDimension(width: 300, height: 300)
        addSubview(container)
        container.anchor(fromTop: nil , fromLeading: nil , fromBottom: bottomAnchor, fromTrailing: nil , padding: .init(top: 0, left: 0, bottom: 80, right: 0))
        container.centerX(inView: self , topAnchor: nil )
    }
}


class TableForMemeberView: UIView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath)
        cell.backgroundColor = .systemBackground
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    private let tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableViewInside()
        tableView.layer.cornerRadius = 190
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        tableView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupTableViewInside() {
        addSubview(tableView)
        
        tableView.isScrollEnabled = true
        tableView.indicatorStyle = .black
        tableView.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: bottomAnchor, fromTrailing: trailingAnchor)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTable")
        setDelegate()
        tableView.rowHeight = 100
    }
    
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
