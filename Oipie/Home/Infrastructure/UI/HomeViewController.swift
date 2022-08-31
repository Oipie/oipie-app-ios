//
//  HomeViewController.swift
//  Oipie
//
//  Created by Daniel Ramos on 30/8/22.
//

import Swinject
import UIKit

class HomeViewController: UIViewController {
    static func build(_: Resolver) -> HomeViewController {
        return HomeViewController()
    }

    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 311, height: 412)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(RecepieCardCollectionViewCell.self, forCellWithReuseIdentifier: RecepieCardCollectionViewCell.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .themeGray
        collection.delegate = self
        collection.dataSource = self
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(collection)
    }

    override func viewDidLayoutSubviews() {
        collection.frame = view.bounds
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecepieCardCollectionViewCell.identifier, for: indexPath
        ) as? RecepieCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
