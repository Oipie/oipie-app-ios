//
//  RecepieRepositoryApi.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Foundation

import Combine
import Swinject

class RecepieRepositoryApi: RecepieRepository {
    let apiClient = ApiClient()

    static func build(_: Resolver) -> RecepieRepositoryApi {
        return RecepieRepositoryApi()
    }

    func find(limit: Int, offset: Int) -> AnyPublisher<[Recepie], Error> {
        return apiClient.getRecepies(limit: limit, offset: offset)
            .map { $0.items }
            .map {
                $0
                    .map {
                        Recepie(name: $0.name, cover: $0.cover, favouriteAmount: $0.favouriteAmount,
                                preparationTime: $0.preparationTime / 1000)
                    }
            }
            .eraseToAnyPublisher()
    }
}
