//
//  MyRecepiesViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import Swinject
import UIKit

class MyRecepiesViewController: UIViewController {
    static func build(_: Resolver) -> MyRecepiesViewController {
        return MyRecepiesViewController()
    }

    let label: UILabel = {
        let title = UILabel()
        title.text = "MyRecepies View"
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        label.center = view.center
        label.frame = view.bounds
    }
}
