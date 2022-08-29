//
//  MainTabBar.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

class MainTabBar: UIStackView {
    weak var delegate: MainTabItemTouchable?
    var items: [MainTabItem] = []

    convenience init(_ controllers: [UIViewController]) {
        self.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .systemBackground
        layer.cornerRadius = 45.0
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        distribution = .fillEqually

        for i in 0 ..< controllers.count {
            let tabItem = MainTabItem(index: i, image: controllers[i].tabBarItem.image!, title: controllers[i].title ?? "")

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

extension MainTabBar: MainTabItemTouchable {
    func onTouch(index: Int) {
        for i in 0 ..< items.count {
            if i == index {
                items[i].setIsSelected()
            } else {
                items[i].setIsNotSelected()
            }
        }

        delegate?.onTouch(index: index)
    }
}
