//
//  ViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import UIKit

class HomeViewController: UIViewController {
    let label: UILabel = {
        let title = UILabel()
        title.text = "Home"
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        label.center = self.view.center
        label.frame = self.view.bounds
    }
}

class SearchViewController: UIViewController {
    let label: UILabel = {
        let title = UILabel()
        title.text = "Search"
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        label.center = self.view.center
        label.frame = self.view.bounds
    }
}

class FavouritesViewController: UIViewController {
    let label: UILabel = {
        let title = UILabel()
        title.text = "Favourites"
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        label.center = self.view.center
        label.frame = self.view.bounds
    }
}

class DoneRecepiesViewController: UIViewController {
    let label: UILabel = {
        let title = UILabel()
        title.text = "Done Recepies"
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        label.center = self.view.center
        label.frame = self.view.bounds
    }
}

class ProfileViewController: UIViewController {
    let label: UILabel = {
        let title = UILabel()
        title.text = "Profile"
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        label.center = self.view.center
        label.frame = self.view.bounds
    }
}
