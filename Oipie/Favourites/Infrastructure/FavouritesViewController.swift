//
//  FavouritesViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import Swinject
import UIKit

class FavouritesViewController: UIViewController {
    static func build(_: Resolver) -> FavouritesViewController {
        return FavouritesViewController()
    }

    let label: UILabel = {
        let title = UILabel()
        title.text = "Favourites View"
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        label.center = view.center
        label.frame = view.bounds
    }
}
