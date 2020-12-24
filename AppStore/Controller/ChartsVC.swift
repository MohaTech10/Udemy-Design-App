//
//  ChartsVC.swift
//  AppStore
//
//  Created by Mohammed mohsen on 04/11/2020.
//  Copyright © 2020 Mohammed mohsen. All rights reserved.
//



import UIKit
struct Person  {
    let name: String
    let age: Int
}
class ChartsVC: UIViewController {
    
    private let view1 = UIView()
    private let view2 = UIView()
    private let view3 = UIView()
    private let view4 = UIView()
    private let view5 = UIView()
    private var saudiArabiaList = [Country]() {
        didSet {
            DispatchQueue.main.async { [weak self] in self?.configure(); self?.setupViews() }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _: [Person] = [.init(name: "Mohammed", age: 20 ), .init(name: "Khalid", age: 20), .init(name: "Rashid", age: 20)]
        
        AppStoreService.shared.fetchCovidForCountry { res  in
            switch res {
            case .success(let data):
                
                self.saudiArabiaList = data.saudi
            case .failure(let e):
                print(e.localizedDescription)
            }
        }
    }
    
    fileprivate func configure() {
        let countryViewModel = CountryViewModel(countrySet: saudiArabiaList)
        guard let last5Days = countryViewModel.last5Days else { return }
        //        let last5DaysViewModel = CountryViewModel(countrySet: last5Days)
        var height = [Int]()
        last5Days.forEach { (instance) in
            print("REcovered , \(instance.recovered)")
            height.append(instance.recovered)
        }
        
        let subViews = [view1, view2, view3, view4, view5]
        let colors: [UIColor] = [.blue, .red, .green, .yellow, .gray]
        var int = 0
        var int2 = 10
        subViews.forEach { (view) in
            self.view.addSubview(view)
            print( (CGFloat(height[int]) / CGFloat(last5Days[int].deaths) ) * 8.4)
            view.setDimension(width: 40, height: ( CGFloat(height[int]) / CGFloat(last5Days[int].deaths) ) * 8.4)
            
            view.centerY(inView: self.view, leadingAnchor: self.view.leadingAnchor, paddingLeading: CGFloat(int2))
            
            int2 += 70
            view.backgroundColor = colors[int]
            int += 1
        }
    }
    
    func setupViews() {
        
        
    }
    
    
}

// Now how to get the max between these object? Well you need to take each one with other
//                if let maxAge = ppl.max { (p1, p2) -> Bool in
//                    p2.age > p1.age }?.age {
//                        print(maxAge)
//                }

