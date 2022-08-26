//
//  TabBarItem.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case favourites = "Favourites"
    case doneRecepies = "Messages"
    case profile = "Profile"

    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .search:
            return SearchViewController()
        case .favourites:
            return FavouritesViewController()
        case .doneRecepies:
            return DoneRecepiesViewController()
        case .profile:
            return ProfileViewController()
        }
    }

    // these can be your icons
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "home")!
        case .search:
            return UIImage(named: "search")!
        case .favourites:
            return UIImage(named: "heart")!
        case .doneRecepies:
            return UIImage(named: "page-flip")!
        case .profile:
            return UIImage(named: "profile-circled")!
        }
    }

    var displayTitle: String {
        return rawValue.capitalized(with: nil)
    }
}
