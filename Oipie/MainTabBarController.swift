//
//  MainTabBarController.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeViewController: HomeViewController
    let searchViewController: SearchViewController
    let favouritesViewController: FavouritesViewController
    let doneRecepiesViewController: DoneRecepiesViewController
    let profileViewController: ProfileViewController
    
    

    static func build() -> MainTabBarController {
        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let favouritesViewController = FavouritesViewController()
        let doneRecepiesViewController = DoneRecepiesViewController()
        let profileViewController = ProfileViewController()

        return MainTabBarController(
            homeViewController: homeViewController,
            searchViewController: searchViewController,
            favouritesViewController: favouritesViewController,
            doneRecepiesViewController: doneRecepiesViewController,
            profileViewController: profileViewController
        )
    }

    init(
        homeViewController: HomeViewController,
        searchViewController: SearchViewController,
        favouritesViewController: FavouritesViewController,
        doneRecepiesViewController: DoneRecepiesViewController,
        profileViewController: ProfileViewController
    ) {
        self.homeViewController = homeViewController
        self.searchViewController = searchViewController
        self.favouritesViewController = favouritesViewController
        self.doneRecepiesViewController = doneRecepiesViewController
        self.profileViewController = profileViewController
        super.init(nibName: nil, bundle: nil)
    }

    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 116.0

    func loadTabBar() {
        let tabItems: [TabItem] = [.home, .search, .favourites, .doneRecepies, .profile]

        setupCustomTabMenu(tabItems)
    }

    func setupCustomTabMenu(_ items: [TabItem]) {
        let frame = tabBar.frame

        tabBar.isHidden = true
        customTabBar = TabNavigationMenu(items, frame: frame)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = changeTab
        view.addSubview(customTabBar)
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])
        view.layoutIfNeeded() // important step
    }

    func changeTab(tab: Int) {
        selectedIndex = tab
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: homeViewController)
        let vc2 = UINavigationController(rootViewController: searchViewController)
        let vc3 = UINavigationController(rootViewController: favouritesViewController)
        let vc4 = UINavigationController(rootViewController: doneRecepiesViewController)
        let vc5 = UINavigationController(rootViewController: profileViewController)

        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "search")
        vc3.tabBarItem.image = UIImage(named: "heart")
        vc4.tabBarItem.image = UIImage(named: "page-flip")
        vc5.tabBarItem.image = UIImage(named: "profile-circled")

        
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Favourites"
        vc4.title = "Done Recepies"
        vc5.title = "Profile"

        tabBar.backgroundColor = .white
        tabBar.tintColor = .black

        setViewControllers2([vc1, vc2, vc3, vc4, vc5], animated: true)

        // loadTabBar()
    }
    
    func setViewControllers2(_ controllers: [UINavigationController], animated: Bool) {
        tabBar.isHidden = true
        
        let customTabBar = UIView(frame: tabBar.frame)
        customTabBar.backgroundColor = .white
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.layer.cornerRadius = 45.0
        customTabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: 116.0), // Fixed height for nav menu
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])
        
        viewControllers = controllers
        
        let colors: [UIColor] = [.systemBlue, .systemRed, .systemPink, .systemGreen, .systemBrown]
        for i in 0 ..< controllers.count {
            let customItem = UIView(frame: .zero)
            customItem.backgroundColor = colors[i]
            customItem.translatesAutoresizingMaskIntoConstraints = false
            customItem.clipsToBounds = true
            
            let itemWidth = customTabBar.frame.width / CGFloat(5)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            customTabBar.addSubview(customItem)
            
            NSLayoutConstraint.activate([
                customItem.heightAnchor.constraint(equalTo: customTabBar.heightAnchor),
                customItem.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor, constant: leadingAnchor),
                customItem.widthAnchor.constraint(equalToConstant: itemWidth),
                customItem.topAnchor.constraint(equalTo: customTabBar.topAnchor),
            ])
        }
        
        /*
        let customTabBar = UIView()
        let height = 200.0
        customTabBar.frame = CGRect(x: 0, y: view.bounds.height - height, width: view.bounds.width, height: height)

        let rectShape = CAShapeLayer()
        rectShape.bounds = customTabBar.frame
        rectShape.position = customTabBar.center
        rectShape.path = UIBezierPath(roundedRect: customTabBar.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 45, height: 45)).cgPath

        customTabBar.layer.backgroundColor = UIColor.green.cgColor
        customTabBar.layer.mask = rectShape
        customTabBar.backgroundColor = .white
        
        view.addSubview(customTabBar)
        viewControllers = controllers*/
    }
}
