//
//  MainTabBarController.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeViewController: HomeViewController
    let upcomingViewController: HomeViewController
    let searchViewController: HomeViewController
    let downloadsViewController: HomeViewController

    static func build() -> MainTabBarController {
        let homeViewController = HomeViewController()
        let upcomingViewController = HomeViewController()
        let searchViewController = HomeViewController()
        let downloadsViewController = HomeViewController()

        return MainTabBarController(
            homeViewController: homeViewController,
            upcomingViewController: upcomingViewController,
            searchViewController: searchViewController,
            downloadsViewController: downloadsViewController
        )
    }

    init(
        homeViewController: HomeViewController,
        upcomingViewController: HomeViewController,
        searchViewController: HomeViewController,
        downloadsViewController: HomeViewController
    ) {
        self.homeViewController = homeViewController
        self.upcomingViewController = upcomingViewController
        self.searchViewController = searchViewController
        self.downloadsViewController = downloadsViewController
        super.init(nibName: nil, bundle: nil)
    }

    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 116.0

    func loadTabBar() {
        let tabItems: [TabItem] = [.home, .search, .favourites, .doneRecepies, .profile]

        setupCustomTabMenu(tabItems) { controllers in
            self.viewControllers = controllers
        }

        selectedIndex = 0 // default our selected index to the first item
    }

    func setupCustomTabMenu(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        // hide the tab bar
        tabBar.isHidden = true
        customTabBar = TabNavigationMenu(items, frame: frame)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = changeTab
        // Add it to the view
        view.addSubview(customTabBar)
        // Add positioning constraints to place the nav menu right where the tab bar should be
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController) // we fetch the matching view controller and append here
        }
        view.layoutIfNeeded() // important step
        completion(controllers) // setup complete. handoff here
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
        let vc2 = UINavigationController(rootViewController: upcomingViewController)
        let vc3 = UINavigationController(rootViewController: searchViewController)
        let vc4 = UINavigationController(rootViewController: downloadsViewController)

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Search"
        vc4.title = "Downloads"

        tabBar.backgroundColor = .white
        tabBar.tintColor = .black

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

        loadTabBar()
    }
}
