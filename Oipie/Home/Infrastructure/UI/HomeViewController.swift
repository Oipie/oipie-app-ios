//
//  HomeViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import UIKit
import Swinject

class HomeViewController: UIViewController {
    static func build(_ resolver: Resolver) -> HomeViewController {
        return HomeViewController()
    }
    
    let label: UILabel = {
        let title = UILabel()
        title.text = "Home View"
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        label.center = view.center
        label.frame = view.bounds
    }
}
