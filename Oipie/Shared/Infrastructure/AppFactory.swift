//
//  AppFactory.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import Swinject

class AppFactory {
    static func create() -> Container {
        let container = Container()

        container.register(HomeViewController.self, factory: HomeViewController.build)
        container.register(SearchViewController.self, factory: SearchViewController.build)
        container.register(FavouritesViewController.self, factory: FavouritesViewController.build)
        container.register(MyRecepiesViewController.self, factory: MyRecepiesViewController.build)
        container.register(ProfileViewController.self, factory: ProfileViewController.build)
        container.register(MainTabBarController.self, factory: MainTabBarController.build)
        container.register(MainTabBarController.self, factory: MainTabBarController.build)

        return container
    }
}
