//
//  HomeUseCases.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Combine
import Foundation
import Swinject

class HomeUseCases {
    private let recepieRepository: RecepieRepository

    public static func build(_ resolver: Resolver) -> HomeUseCases {
        return HomeUseCases(
            recepieRepository: resolver.resolve(RecepieRepository.self)!
        )
    }

    init(recepieRepository: RecepieRepository) {
        self.recepieRepository = recepieRepository
    }

    func getRecepies() -> AnyPublisher<[Recepie], Error> {
        return recepieRepository.find(limit: 3, offset: 0)
    }

    func loadMoreRecepiesFrom(offset: Int) -> AnyPublisher<[Recepie], Error> {
        return recepieRepository.find(limit: 3, offset: offset)
    }
}
