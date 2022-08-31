//
//  RecepieCardUIView.swift
//  Oipie
//
//  Created by Daniel Ramos on 31/8/22.
//

import UIKit
import Kingfisher

class RecepieCardCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecepieCardUICollectionViewCell"
    
    let thumbnail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.kf.setImage(with: URL(string: "https://i.imgur.com/ISxVZHA.png"))
        return image
    }()
    
    let content: UIView = {
        let view = UIView(frame: .zero)
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .themeWhite
        layer.cornerRadius = 40
        
        addSubview(content)
        content.frame = bounds
        content.clipsToBounds = true

        content.addSubview(thumbnail)

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.17
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        
        NSLayoutConstraint.activate([
            thumbnail.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            thumbnail.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            thumbnail.topAnchor.constraint(equalTo: content.topAnchor),
            thumbnail.heightAnchor.constraint(equalTo: thumbnail.widthAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
