//
//  RecepieCardLabel.swift
//  Oipie
//
//  Created by Daniel Ramos on 31/8/22.
//

import UIKit

class RecepieCardLabel: UIView {
    let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .themeViolet
        return icon
    }()

    let dashLabel: UILabel = {
        let dash = UILabel()
        dash.translatesAutoresizingMaskIntoConstraints = false
        dash.text = " - "
        dash.font = UIFont(name: FontFamily.montserratRegular.rawValue, size: FontSize.intermediate.rawValue)
        dash.textColor = .label
        return dash
    }()

    let valueLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.font = UIFont(name: FontFamily.montserratRegular.rawValue, size: FontSize.intermediate.rawValue)
        value.textColor = .label
        return value
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconImageView)
        addSubview(dashLabel)
        addSubview(valueLabel)

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 10),
            iconImageView.widthAnchor.constraint(equalToConstant: 9),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dashLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: dashLabel.trailingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            heightAnchor.constraint(equalTo: valueLabel.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dashLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    convenience init(icon: IconName) {
        self.init(frame: .zero)
        iconImageView.image = UIImage(icon: icon)
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError()
    }

    func configure(text: String) {
        valueLabel.text = text
    }
}
