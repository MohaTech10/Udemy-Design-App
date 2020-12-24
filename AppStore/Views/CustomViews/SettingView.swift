import UIKit
//
//      self.collectionView.frame = CGRect(x: 0, y: window.frame.height - 100, width: self.collectionView.frame.width, height: self.collectionView.frame.height)

struct Setting {
    let settingName: String
    let iconSetting: UIImage
}
class SettingView: UIView {
    
    
    let cellHeight = 50
    var settings: [Setting] {
        let set1 = Setting(settingName: "Quality", iconSetting: #imageLiteral(resourceName: "gear"))
        let set2 = Setting(settingName: "Captions", iconSetting: #imageLiteral(resourceName: "new_tweet"))
        
        let set3 = Setting(settingName: "Quality", iconSetting: #imageLiteral(resourceName: "gear"))
        let set4 = Setting(settingName: "Captions", iconSetting: #imageLiteral(resourceName: "new_tweet"))
        
        let set5 = Setting(settingName: "Quality", iconSetting: #imageLiteral(resourceName: "gear"))
        let set6 = Setting(settingName: "Captions", iconSetting: #imageLiteral(resourceName: "new_tweet"))
        return [set1, set2, set3, set4, set5, set6]
    }
    private let collectionView: UICollectionView = {
        let layout = FlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        showSetting()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismiss() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            
            
            //
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        }
    }
    
    func showSetting() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        window.addSubview(self)
        window.addSubview(collectionView)
        self.frame = window.frame
        self.alpha = 0
        
        let height: CGFloat = CGFloat(settings.count * cellHeight)
        let y = window.frame.height - height
        
        
        collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        self.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.alpha = 1
  

            self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width , height: self.collectionView.frame.height)
        }) { finishedAnimated in
            
        }
    }
    
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SettingCell.self , forCellWithReuseIdentifier: "cell")
        collectionView.isScrollEnabled = false
        
    }
}


extension SettingView: CollectionViewMethods {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SettingCell
        cell.setting = settings[indexPath.row]
//        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(cellHeight))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet { showContent( ) }
    }
    
    fileprivate func showContent() {
        guard let setting = setting else { return }
        settingName.text = setting.settingName
        iconSetting.image = setting.iconSetting
    }
    private let settingName: UILabel = {
        let ul = UILabel()
        ul.text = "setiing"
        ul.font = .systemFont(ofSize: 13)
        ul.textColor = .label
        return ul
    }()
    
    private let iconSetting: UIImageView =  {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
        iv.setDimension(width: 20 , height: 20  )
        return iv
    }()
    
    override func setupViews() {
        let hStack = UIStackView(arrangedSubviews: [iconSetting, settingName])
        addSubview(hStack )
        hStack.spacing = 8
        hStack.alignment = .leading
        hStack.distribution = .equalCentering
        
        hStack.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0))

    }
}
