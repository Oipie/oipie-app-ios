//
//  Recepie.swift
//  Oipie
//
//  Created by Daniel Ramos on 31/8/22.
//

import Foundation

class Recepie {
    private let name: String
    private let cover: String
    private let favouriteAmount: Int
    private let preparationTime: TimeInterval

    init(name: String, cover: String, favouriteAmount: Int, preparationTime: TimeInterval) {
        self.name = name
        self.cover = cover
        self.favouriteAmount = favouriteAmount
        self.preparationTime = preparationTime
    }

    func getName() -> String {
        return name
    }

    func getCover() -> String {
        return cover
    }

    func getFavouriteAmount() -> Int {
        return favouriteAmount
    }

    func getPreparationTimeFormatted() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .brief
        formatter.allowedUnits = [.hour, .minute]

        let formattedDuration = formatter.string(from: preparationTime)

        return formattedDuration ?? String(favouriteAmount)
    }
}
