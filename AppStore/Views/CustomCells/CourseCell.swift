//
//  CourseCell.swift
//  AppStore
//
//  Created by Mohammed mohsen on 05/11/2020.
//  Copyright © 2020 Mohammed mohsen. All rights reserved.
//

import UIKit

struct Model {
    let courseRatingLabel: CourseLable
}
class CourseCell: BaseCell {
    
    public var model: Model? {
        didSet { showContent() }
    }
    
    fileprivate func showContent() {
        guard let model = model else { return }
        let courseViewModel = CourseViewModel(model: model)
        courseLabel.setTitle(courseViewModel.getLabelString, for: .normal)
        courseLabel.backgroundColor = courseViewModel.getLabelColor

        
    }
    
    
    static let cellId = "courseCell"
    private let courseImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
        iv.image = #imageLiteral(resourceName: "HeaerFoodImage")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let courseInfo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        label.textColor = .label
        
        label.text = "JavaScript for absolute beginners new way of learning ins.david cs50 high rate 5 sts very long scentence for .\n" + "$".localized() + "99"
        return label
    }()
    
    private let coursePrice: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let courseLabel: UIButton = {
        let label = UIButton()
        label.titleLabel?.textAlignment = .center
        label.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        label.layer.cornerRadius = 3
        label.setTitleColor(UIColor(named: "courseLabel"), for: .normal)
        return label
    }()
    

    override func setupViews() {
        
        addSubview(courseImage)
        addSubview(courseInfo)
        addSubview(courseLabel)
        
        courseImage.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: trailingAnchor, padding: .init(top: 5, left: 7, bottom: 0, right: -7), size: .init(width: 0, height: 125))
        courseInfo.anchor(fromTop: courseImage.bottomAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: trailingAnchor, padding: .init(top: 3, left: 8, bottom: 0, right: 0))
        courseLabel.anchor(fromTop: courseInfo.bottomAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: nil, padding: .init(top: 3, left: 7, bottom: 0, right: -7), size: .init(width: 88, height: 23))
        
        
        
    }
}


extension UIColor {
  static var customColor: UIColor {
    return UIColor { (trait) -> UIColor in
     switch trait.userInterfaceStyle {
     case .dark:
      return #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
     case .light:
         return #colorLiteral(red: 0.137254902, green: 0.168627451, blue: 0.168627451, alpha: 1)
     default:
        return .black// your old background color for ligth style
     }
    }
  }
}
