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

    var recepies: [Recepie] = []

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

    private var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .themeGray
        collection.delegate = self
        collection.dataSource = self
        navigationController?.navigationBar.isHidden = true

        view.addSubview(collection)

        presenter?.loadRecepies()
    }

    public static func initCompleted(_ resolver: Resolver, _ homeViewController: HomeViewController) {
        homeViewController.setPresenter(resolver.resolve(HomePresenter.self)!)
    }

    override func viewDidLayoutSubviews() {
        collection.frame = view.bounds
    }

    func setPresenter(_ presenter: HomePresenter) {
        self.presenter = presenter
    }
}

extension HomeViewController: HomeViewDelegate {
    func presentRecepies(_ recepies: [Recepie]) {
        self.recepies = recepies

        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }

    func addRecepies(_ recepies: [Recepie]) {
        self.recepies.append(contentsOf: recepies)

        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return recepies.count
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            presenter?.loadMoreRecepies(recepies.count)
        }
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
