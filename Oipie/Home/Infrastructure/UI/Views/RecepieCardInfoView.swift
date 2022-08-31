//
//  RecepieCardInfoView.swift
//  Oipie
//
//  Created by Daniel Ramos on 31/8/22.
//

import Foundation
import UIKit


class RecepieCardInfoView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pumpkin Soup"
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.green.cgColor
        return label
    }()
    
    let content: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
        
        view.backgroundColor = .yellow
        
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        
        content.addSubview(label)
        
        addSubview(content)
        
        NSLayoutConstraint.activate([
            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            label.topAnchor.constraint(equalTo: content.topAnchor),
            label.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
