//
//  HomePresenter.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Combine
import Foundation
import Swinject

class HomePresenter {
    private weak var homeView: HomeViewDelegate?
    let homeUseCases: HomeUseCases
    private var cancellable: AnyCancellable?

    public static func build(_ resolver: Resolver) -> HomePresenter {
        let delegate = resolver.resolve(HomeViewDelegate.self)!
        let homeUseCases = resolver.resolve(HomeUseCases.self)!
        return HomePresenter(delegate: delegate, homeUseCases: homeUseCases)
    }

    init(delegate: HomeViewDelegate?, homeUseCases: HomeUseCases) {
        homeView = delegate
        self.homeUseCases = homeUseCases
    }

    func loadRecepies() {
        cancellable = homeUseCases.getRecepies()
            .catch { error -> AnyPublisher<[Recepie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] recepies in
                    self?.homeView?.presentRecepies(recepies)
                }
            )
    }
}
