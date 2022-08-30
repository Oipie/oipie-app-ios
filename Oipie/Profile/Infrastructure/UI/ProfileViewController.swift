//
//  ProfileViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import Swinject
import UIKit

class ProfileViewController: UIViewController {
    static func build(_: Resolver) -> ProfileViewController {
        return ProfileViewController()
    }

    let label: UILabel = {
        let title = UILabel()
        title.text = "Profile View"
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        label.center = view.center
        label.frame = view.bounds
    }
}
