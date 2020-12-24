//
//  HomeVC.swift
//  AppStore
//
//  Created by Mohammed mohsen on 04/11/2020.
//  Copyright © 2020 Mohammed mohsen. All rights reserved.
//

import UIKit

class HomeVC: UICollectionViewController {
    
    
    private let v: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        return v
    }()
    // MARK: Initilizers
    init() {
        let layout = FlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - App Lifecycle

     func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(v)
        v.anchor(fromTop: view.topAnchor, fromLeading: view.leadingAnchor, fromBottom: nil , fromTrailing: view.trailingAnchor, size: .init(width: 0, height: getStatusBarHeight()))
        print(getStatusBarHeight())
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = true
        collectionView.backgroundColor = .systemBackground
    }
    
    // MARK: - Helpers
    fileprivate func setupCollectionView() {
        // Register cell classes
        collectionView.register(CoursesCellContainer.self, forCellWithReuseIdentifier: CoursesCellContainer.cellId)
        collectionView.register(HeaderHome.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false 
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCellContainer.cellId, for: indexPath)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind , withReuseIdentifier: "header", for: indexPath)
        
        return header
    }
   
    
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 290)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 320)
    }
}

