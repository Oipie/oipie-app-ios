//
//  SearchViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import UIKit
import Swinject

class SearchViewController: UIViewController {
    static func build(_ resolver: Resolver) -> SearchViewController {
        return SearchViewController()
    }
    
    let label: UILabel = {
        let title = UILabel()
        title.text = "Search View"
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        label.center = view.center
        label.frame = view.bounds
    }
}
