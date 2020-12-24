import UIKit

class MainTabController: UITabBarController {
    
    
    private let settingsButton: UIButton =  {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray
        button.setImage(#imageLiteral(resourceName: "levels").withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .red
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemPink
        setupTabBar()
        setupSettingButton()
    }
    
    
    fileprivate func setupTabBar() {
        
        let feedTabImage =  UIImage(systemName: "house")
        let feedVc = generateNavController(vc: HomeVC() , navTitle: "Courses".localized(), barTitle: "Home", withImage: feedTabImage)
        let f2 = generateNavController(vc: F2(), navTitle: "Search", barTitle: "Search", withImage: UIImage(systemName: "magnifyingglass"))
        let f3 = generateNavController(vc: F3(), navTitle: "My Courses", barTitle: " My Courses", withImage: UIImage(systemName: "play.circle"))
        let f4 = generateNavController(vc: F4(), navTitle: "", barTitle: "Wishlist", withImage: UIImage(systemName: "suit.heart"))
        let f5 = generateNavController(vc: F5(), navTitle: "", barTitle: "Account", withImage: UIImage(systemName: "rectangle.stack.person.crop"))
        
        viewControllers = [feedVc, f2, f3, f4, f5]
    }
    
    fileprivate func generateNavController(vc: UIViewController, navTitle: String, barTitle: String, withImage image: UIImage?) -> UINavigationController {
        
        vc.navigationItem.title = navTitle
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.title = barTitle
        if let image = image {
            navigationController.tabBarItem.image = image
            
        }
        return navigationController
    }
    
    fileprivate func setupSettingButton () {
        //        view.addSubview(settingsButton)
        //        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        //        topAnchorConstraint = settingsButton.topAnchor.constraint(equalTo: view.topAnchor)
        //        NSLayoutConstraint.activate([
        //            topAnchorConstraint!,
        //            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4)
        //        ])
        //        settingsButton.setDimension(width: 70, height: 30)
        //        settingsButton.layer.cornerRadius = 30
        //        settingsButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        //
    }
    
    
}


class F2: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class F3: UIViewController {
    
    private let buttonWillReprsentView: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Push", for: .normal)
        b.backgroundColor = .green
        return b
    }()
    
    var i: Int = 0

    let myStack = Stack<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonWillReprsentView)
        buttonWillReprsentView.addTarget(self , action: #selector(showVideo), for: .touchUpInside)
        buttonWillReprsentView.center(inView: view)
        buttonWillReprsentView.setDimension(width: 120, height: 60)
    }
    
    @objc func showVideo() {
        if (!myStack.isEmpty) {
            myStack.pop()
        }
        myStack.push(obj: "changable  \(i)")
        print(myStack.data)
        i += 1
    }
}
class F4: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
class F5: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class Stack<E> {
    var top: Int = -1
    var data: [E] = []  // Dynamic Array
    
    func push(obj: E) {
        top += 1
        data.append(obj)
    }
    
    func pop() -> E? {
        if (isEmpty) {
            return nil

        }
        top -= 1
        return data.removeLast()
    }
    var isEmpty: Bool {
        return top == -1
    }
    
    var peek: E? {
        if (isEmpty) { return nil }
        return data[top]
    }
    
    
    
}
