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

extension UIColor {
  class var themeViolet: UIColor {
      return UIColor(named: "Violet")!
  }
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
        label.font = UIFont(name: "Montserrat-SemiBold", size: 10.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .themeViolet
        label.textAlignment = .center
        label.isHidden = true
        label.alpha = 0
        return label
    }()
    
    let point: UIView = {
        let block = UIView(frame: .zero)
        block.translatesAutoresizingMaskIntoConstraints = false
        block.clipsToBounds = true
        block.backgroundColor = .themeViolet
        block.layer.cornerRadius = 2
        block.isHidden = true
        block.alpha = 0
        return block
    }()
    var index: Int = 0
    
    convenience init(index: Int ,image: UIImage, title: String) {
        self.init(frame: .zero)
        self.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        self.index = index

        icon.image = image.withTintColor(.label)
        label.text = title.uppercased()
        
        
        addSubview(point)
        addSubview(label)
        addSubview(icon)
        
        setIconConstriants()
        setLabelConstriants()
        setPointConstriants()
    }
    
    func setIsSelected() {
        label.isHidden = false
        point.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.label.alpha = 1
            self.point.alpha = 1
        })
    }
    
    func setIsNotSelected() {
        UIView.animate(withDuration: 0.3, animations: {
            self.label.alpha = 0
            self.point.alpha = 0
        }) { _ in
            self.label.isHidden = true
            self.point.isHidden = true
        }
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
            label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 4)
        ])
    }
    
    private func setPointConstriants() {
        NSLayoutConstraint.activate([
            point.centerXAnchor.constraint(equalTo: centerXAnchor),
            point.bottomAnchor.constraint(equalTo: icon.topAnchor, constant: -5),
            point.heightAnchor.constraint(equalToConstant: 4),
            point.widthAnchor.constraint(equalToConstant: 4)
        ])
    }
}
