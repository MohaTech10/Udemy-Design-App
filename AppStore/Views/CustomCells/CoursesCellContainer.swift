import UIKit

class CoursesCellContainer: BaseCell, CollectionViewMethods {
    
    private var models: [Model] {
        
        let models: [Model] = [.init(courseRatingLabel: .bestSeller), .init(courseRatingLabel: .highestRated), .init(courseRatingLabel: .hotNew)]
        return models
    }
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Featured".localized()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCell.cellId, for: indexPath) as! CourseCell
        cell.model = models[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let _ = SettingView()
        
        
    }
    static let cellId = "cell"
    private let collectionView: UICollectionView = {
        
        let layout = FlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    
    override func setupViews() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CourseCell.self , forCellWithReuseIdentifier: CourseCell.cellId)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SeeAllFooter.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        addSubview(collectionView)
        addSubview(categoryLabel)
        categoryLabel.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: trailingAnchor, padding: .init(top: 20, left: 7, bottom: 0, right: -7))
        collectionView.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: bottomAnchor, fromTrailing: trailingAnchor)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 1.3 , height: frame.height / 1.5 )
    }
    
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
        
        return footer
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        //        if numberCourse == 1 {
        //            return .zero
        //        }
        return CGSize(width: frame.width / 3, height: frame.height / 1.3 )
    }
    
}



