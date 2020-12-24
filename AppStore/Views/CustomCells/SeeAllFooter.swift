//
//  SeeAllFooter.swift
//  AppStore
//
//  Created by Mohammed mohsen on 05/11/2020.
//  Copyright © 2020 Mohammed mohsen. All rights reserved.
//

import UIKit

class SeeAllFooter: UICollectionReusableView {
    
    
    private let seeAllButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("See all".localized(), for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews( ) {
        addSubview(seeAllButton)
        seeAllButton.center(inView: self)
        seeAllButton.setDimension(width: 90, height: 50)
    }
}
