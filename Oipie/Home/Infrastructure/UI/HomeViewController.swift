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

    let recepies: [Recepie] = [
        Recepie(
            name: PUMPKIN_SOUP.name,
            cover: PUMPKIN_SOUP.cover,
            favouriteAmount: PUMPKIN_SOUP.favouriteAmount,
            preparationTime: PUMPKIN_SOUP.preparationTimeSeconds
        ),
        Recepie(
            name: FRENCH_TOAST.name,
            cover: FRENCH_TOAST.cover,
            favouriteAmount: FRENCH_TOAST.favouriteAmount,
            preparationTime: FRENCH_TOAST.preparationTimeSeconds
        ),
    ]

    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 311, height: 412)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(
            RecepieCardCollectionViewCell.self,
            forCellWithReuseIdentifier: RecepieCardCollectionViewCell.identifier
        )
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)

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
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return recepies.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecepieCardCollectionViewCell.identifier, for: indexPath
        ) as? RecepieCardCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(recepies[indexPath.row])
        cell.setNeedsDisplay()

        return cell
    }
}
