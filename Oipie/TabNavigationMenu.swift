//
//  TabNavigationMenu.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

class TabNavigationMenu: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(_ menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)

        layer.backgroundColor = UIColor.red.cgColor
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)

            let itemView = createTabItem(item: menuItems[i])
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.tag = i
            addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: topAnchor),
            ])
        }
        setNeedsLayout()
        layoutIfNeeded()
        activateTab(tab: 0) // activate the first tab
    }

    func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textColor = .black
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true

        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor.white.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 25), // Fixed height for our tab item(25pts)
            itemIconView.widthAnchor.constraint(equalToConstant: 25), // Fixed width for our tab item icon
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8), // Position menu item icon 8pts from the top of it's parent view
            itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 13), // Fixed height for title label
            itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
            itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4), // Position title label 4pts below item icon
        ])
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap))) // Each item should be able to trigger and action on tap
        return tabBarItem
    }

    @objc func handleTap(_ sender: UIGestureRecognizer) {
        switchTab(from: activeItem, to: sender.view!.tag)
    }

    func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }

    func activateTab(tab: Int) {
        let tabToActivate = subviews[tab]
        let borderWidth = tabToActivate.frame.size.width - 20
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.green.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 2)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        activeItem = tab
    }

    func deactivateTab(tab: Int) {
        let inactiveTab = subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter { $0.name == "active border" }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove.forEach { $0.removeFromSuperlayer() }
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
