//
//  MainTabBar.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

class MainTabBar: UIStackView {
    convenience init(_ controllers: [UIViewController]) {
        self.init(frame: .zero)

        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 45.0
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        distribution = .fillEqually

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 116.0), // Fixed height for nav menu
        ])

        for i in 0 ..< controllers.count {
            let customItem = MainTabItem(image: controllers[i].tabBarItem.image!, title: controllers[i].title ?? "")
            addArrangedSubview(customItem)
        }
    }
}
