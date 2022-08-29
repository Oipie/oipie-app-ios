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

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .white
        layer.cornerRadius = 45.0
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        distribution = .fillEqually

        for i in 0 ..< controllers.count {
            addArrangedSubview(MainTabItem(image: controllers[i].tabBarItem.image!, title: controllers[i].title ?? ""))
        }
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 116.0),
        ])
    }
}
