//
//  HeaderHome.swift
//  AppStore
//
//  Created by Mohammed mohsen on 05/11/2020.
//  Copyright © 2020 Mohammed mohsen. All rights reserved.
//

import UIKit

class HeaderHome: UICollectionReusableView {
    static let headerId = "headid"
    private let courseImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "ceoFace")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 4
        return iv
    }()
    
    private let saleCoursesBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 4
        btn.setTitle("Learn for as low as SAR 54.55\n Ends in 1 day", for: .normal)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        btn.setTitleColor(.label, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupSubviews() {
        let vStack = UIStackView(arrangedSubviews: [courseImage, saleCoursesBtn])
        vStack.axis = .vertical
        vStack.distribution = .equalSpacing
        addSubview(vStack)
        vStack.anchor(fromTop: topAnchor, fromLeading: leadingAnchor, fromBottom: nil , fromTrailing: trailingAnchor,padding: .init(top: 0, left: 7, bottom: 0, right: -7),size: .init(width: 0, height: 280))
        vStack.spacing = 12
        saleCoursesBtn.translatesAutoresizingMaskIntoConstraints = false
        saleCoursesBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
    }
    
    
    
}
