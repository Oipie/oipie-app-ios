//
//  RecepieRepositoryFake.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Combine
import Swinject

class RecepieRepositoryFake: RecepieRepository {
    let recepies = [
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

    static func build(_: Resolver) -> RecepieRepositoryFake {
        return RecepieRepositoryFake()
    }

    func find(limit _: Int, offset _: Int) -> AnyPublisher<[Recepie], Error> {
        return Just(recepies).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
