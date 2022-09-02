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
    
    private var cancellable1: AnyCancellable?
    private var cancellable2: AnyCancellable?
    
    private var needMoreRecepiesSubject = PassthroughSubject<Int, Error>()

    public static func build(_ resolver: Resolver) -> HomePresenter {
        let delegate = resolver.resolve(HomeViewDelegate.self)!
        let homeUseCases = resolver.resolve(HomeUseCases.self)!
        return HomePresenter(delegate: delegate, homeUseCases: homeUseCases)
    }

    init(delegate: HomeViewDelegate?, homeUseCases: HomeUseCases) {
        homeView = delegate
        self.homeUseCases = homeUseCases
        
        cancellable2 = needMoreRecepiesSubject
            .throttle(for: 2.0, scheduler: RunLoop.main, latest: false)
            .flatMap { homeUseCases.loadMoreRecepiesFrom(offset: $0) }
            .catch { error -> AnyPublisher<[Recepie], Never> in
                print("This is the error \(error)")
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }
            .sink(
                receiveValue: { [weak self] recepies in
                    self?.homeView?.addRecepies(recepies)
                }
            )
    }

    func loadRecepies() {
        cancellable1 = homeUseCases.getRecepies()
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
    
    func loadMoreRecepies(_ offset: Int) {
        needMoreRecepiesSubject.send(offset)
    }
}
