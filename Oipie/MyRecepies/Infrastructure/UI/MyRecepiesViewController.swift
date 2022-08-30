//
//  MyRecepiesViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import UIKit
import Swinject

class MyRecepiesViewController: UIViewController {
    static func build(_ resolver: Resolver) -> MyRecepiesViewController {
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
