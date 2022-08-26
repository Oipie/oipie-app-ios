//
//  TabBarItem.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

enum TabItem: String, CaseIterable {
    case calls
    case photos
    case contacts
    case messages

    var viewController: UIViewController {
        switch self {
        case .calls:
            return HomeViewController()
        case .photos:
            return HomeViewController()
        case .contacts:
            return SearchViewController()
        case .messages:
            return HomeViewController()
        }
    }

    // these can be your icons
    var icon: UIImage {
        switch self {
        case .calls:
            return UIImage(systemName: "house")!

        case .photos:
            return UIImage(systemName: "house")!
        case .contacts:
            return UIImage(systemName: "house")!
        case .messages:
            return UIImage(systemName: "house")!
        }
    }

    var displayTitle: String {
        return rawValue.capitalized(with: nil)
    }
}
