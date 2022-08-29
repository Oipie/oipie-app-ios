//
//  MainTabItem.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

class MainTabItem: UIButton {
    convenience init(image: UIImage, title: String) {
        self.init(frame: .zero)

        let image = UIImageView(image: image)
        image.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.text = title.uppercased()
        label.textAlignment = .center
        let font = UIFont(name: "Montserrat-SemiBold", size: 10.0)
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)
        addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor),
        ])
    }
}
