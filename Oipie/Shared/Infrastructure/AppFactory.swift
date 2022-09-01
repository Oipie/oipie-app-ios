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

        addRepositories(container)

        container.register(SearchViewController.self, factory: SearchViewController.build)
        container.register(FavouritesViewController.self, factory: FavouritesViewController.build)
        container.register(MyRecepiesViewController.self, factory: MyRecepiesViewController.build)
        container.register(ProfileViewController.self, factory: ProfileViewController.build)
        container.register(MainTabBarController.self, factory: MainTabBarController.build)
        container.register(MainTabBarController.self, factory: MainTabBarController.build)

        container.register(HomeUseCases.self, factory: HomeUseCases.build)
        container
            .register(HomeViewController.self, factory: HomeViewController.build)
            .initCompleted(HomeViewController.initCompleted)
        container.register(HomeViewDelegate.self) { resolver in resolver.resolve(HomeViewController.self)! }
        container.register(HomePresenter.self, factory: HomePresenter.build)

        return container
    }

    static func addRepositories(_ container: Container) {
        container.register(RecepieRepository.self, factory: RecepieRepositoryApi.build)
    }
}
