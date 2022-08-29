//
//  MainTabItem.swift
//  Oipie
//
//  Created by Adrián García García on 29/8/22.
//

import UIKit

protocol MainTabItemTouchable: AnyObject {
    func onTouch(index: Int)
}

class MainTabItem: UIButton {
    weak var delegate: MainTabItemTouchable?
    
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
    
    let point: UIView = {
        let block = UIView(frame: .zero)
        block.backgroundColor = .black
        block.layer.cornerRadius = 12
        block.translatesAutoresizingMaskIntoConstraints = false
        block.clipsToBounds = true
        return block
    }()
    var index: Int = 0
    
    convenience init(index: Int ,image: UIImage, title: String) {
        self.init(frame: .zero)
        self.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        self.index = index

        icon.image = image
        label.text = title.uppercased()
        
        
        addSubview(point)
        addSubview(label)
        addSubview(icon)
        
        setIconConstriants()
        setLabelConstriants()
        setPointConstriants()
    }
    
    @objc private func onClick(_ sender: UIButton!){
        delegate?.onTouch(index: index)
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
    
    private func setPointConstriants() {
        NSLayoutConstraint.activate([
            point.centerXAnchor.constraint(equalTo: centerXAnchor),
            point.bottomAnchor.constraint(equalTo: icon.topAnchor),
            point.heightAnchor.constraint(equalToConstant: 10.0),
            point.widthAnchor.constraint(equalToConstant: 10.0)
        ])
    }
}
