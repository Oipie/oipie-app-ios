//
//  MainTabItem.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

class MainTabItem: UIButton {
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Montserrat-SemiBold", size: 10.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init(image: UIImage, title: String) {
        self.init(frame: .zero)

        icon.image = image
        label.text = title.uppercased()

        addSubview(label)
        addSubview(icon)
        
        setIconConstriants()
        setLabelConstriants()
    }
    
    private func setIconConstriants() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setLabelConstriants() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: icon.bottomAnchor)
        ])
    }
}
