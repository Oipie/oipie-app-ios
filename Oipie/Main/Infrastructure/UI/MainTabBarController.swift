//
//  MainTabBarController.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit
import Swinject

class MainTabBarController: UITabBarController {
    let homeViewController: HomeViewController
    let searchViewController: SearchViewController
    let favouritesViewController: FavouritesViewController
    let myRecepiesViewController: MyRecepiesViewController
    let profileViewController: ProfileViewController

    static func build(_ resolver: Resolver) -> MainTabBarController {
        let homeViewController = resolver.resolve(HomeViewController.self)!
        let searchViewController = resolver.resolve(SearchViewController.self)!
        let favouritesViewController = resolver.resolve(FavouritesViewController.self)!
        let myRecepiesViewController = resolver.resolve(MyRecepiesViewController.self)!
        let profileViewController = resolver.resolve(ProfileViewController.self)!

        return MainTabBarController(
            homeViewController: homeViewController,
            searchViewController: searchViewController,
            favouritesViewController: favouritesViewController,
            myRecepiesViewController: myRecepiesViewController,
            profileViewController: profileViewController
        )
    }

    init(
        homeViewController: HomeViewController,
        searchViewController: SearchViewController,
        favouritesViewController: FavouritesViewController,
        myRecepiesViewController: MyRecepiesViewController,
        profileViewController: ProfileViewController
    ) {
        self.homeViewController = homeViewController
        self.searchViewController = searchViewController
        self.favouritesViewController = favouritesViewController
        self.myRecepiesViewController = myRecepiesViewController
        self.profileViewController = profileViewController
        super.init(nibName: nil, bundle: nil)
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
        let vc4 = UINavigationController(rootViewController: myRecepiesViewController)
        let vc5 = UINavigationController(rootViewController: profileViewController)

        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "search")
        vc3.tabBarItem.image = UIImage(named: "heart")
        vc4.tabBarItem.image = UIImage(named: "page-flip")
        vc5.tabBarItem.image = UIImage(named: "profile-circled")

        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Favourites"
        vc4.title = "My Recepies"
        vc5.title = "Profile"

        tabBar.backgroundColor = .white
        tabBar.tintColor = .black

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }

    func setViewControllers(_ controllers: [UINavigationController], animated _: Bool) {
        tabBar.isHidden = true

        let mainTabBar = MainTabBar(controllers)
        mainTabBar.delegate = self

        view.addSubview(mainTabBar)

        NSLayoutConstraint.activate([
            mainTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            mainTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            mainTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            mainTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])

        viewControllers = controllers
    }
}

extension MainTabBarController: MainTabBarDelegate {
    func tabBar(_ tabBar: MainTabBar, didSelect item: MainTabBarItem) {
        selectedIndex = item.index
    }
}
