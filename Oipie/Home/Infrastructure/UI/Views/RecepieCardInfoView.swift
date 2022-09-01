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
        label.font = UIFont(name: FontFamily.montserratSemiBold.rawValue, size: FontSize.medium.rawValue)
        return label
    }()
    
    let content: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favouriteAndTimeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favouriteLabel = RecepieCardLabel()
    let cookTimeLabel = RecepieCardLabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        favouriteAndTimeContainer.addSubview(favouriteLabel)
        favouriteAndTimeContainer.addSubview(cookTimeLabel)
        content.addSubview(label)
        content.addSubview(favouriteAndTimeContainer)
        self.addSubview(content)
        
        // favouriteAndTimeContainer.backgroundColor = .systemYellow
        // content.backgroundColor = .systemGreen
        // self.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            content.centerYAnchor.constraint(equalTo: centerYAnchor),
            content.topAnchor.constraint(equalTo: label.topAnchor),
            content.bottomAnchor.constraint(equalTo: favouriteAndTimeContainer.bottomAnchor),
            content.widthAnchor.constraint(equalTo: favouriteAndTimeContainer.widthAnchor),
            label.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            favouriteAndTimeContainer.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            favouriteAndTimeContainer.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            favouriteAndTimeContainer.heightAnchor.constraint(equalTo: favouriteLabel.heightAnchor),
            favouriteAndTimeContainer.leadingAnchor.constraint(equalTo: favouriteLabel.leadingAnchor),
            favouriteAndTimeContainer.trailingAnchor.constraint(equalTo: cookTimeLabel.trailingAnchor),
            cookTimeLabel.leadingAnchor.constraint(equalTo: favouriteLabel.trailingAnchor, constant: 26)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func configure(_ recepie: Recepie) {
        label.text = recepie.getName().uppercased()
    }
}
