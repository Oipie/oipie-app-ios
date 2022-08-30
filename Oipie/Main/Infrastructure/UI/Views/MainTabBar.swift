//
//  MainTabBar.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

protocol MainTabBarDelegate: AnyObject {
    func tabBar(_ tabBar: MainTabBar, didSelect item: MainTabBarItem)
}

class MainTabBar: UIStackView {
    weak var delegate: MainTabBarDelegate?
    var items: [MainTabBarItem] = []

    convenience init(_ controllers: [UIViewController]) {
        self.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .systemBackground
        layer.cornerRadius = 45.0
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        distribution = .fillEqually

        for i in 0 ..< controllers.count {
            let tabItem = MainTabBarItem(
                index: i,
                image: controllers[i].tabBarItem.image!,
                title: controllers[i].title ?? ""
            )

            if i == 0 {
                tabItem.setIsSelected()
            }

            tabItem.delegate = self
            addArrangedSubview(tabItem)
            items.append(tabItem)
        }

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 116.0),
        ])
    }
}

extension MainTabBar: MainTabBarItemDelegate {
    func tabBarItem(didSelect item: MainTabBarItem) {
        item.setIsSelected()

        items
            .filter { $0.index != item.index }
            .forEach { $0.setIsNotSelected() }

        delegate?.tabBar(self, didSelect: item)
    }
}
