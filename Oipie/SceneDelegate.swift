//
//  SceneDelegate.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let container = AppFactory.create()

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = container.resolve(MainTabBarController.self)
        window?.makeKeyAndVisible()
    }
}
