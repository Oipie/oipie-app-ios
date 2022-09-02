//
//  Recepies.swift
//  Oipie
//
//  Created by Daniel Ramos on 31/8/22.
//
// swiftlint:disable identifier_name

import Foundation

struct RecepieFixture {
    let name: String
    let cover: String
    let favouriteAmount: Int
    let preparationTimeMs: Int
    let preparationTimeSeconds: Int
}

let PUMPKIN_SOUP = RecepieFixture(
    name: "Pumpkin Soup",
    cover: "https://i.imgur.com/ISxVZHA.png",
    favouriteAmount: 245,
    preparationTimeMs: 900_000,
    preparationTimeSeconds: 900
)

let FRENCH_TOAST = RecepieFixture(
    name: "French toast",
    cover: "https://i.imgur.com/GNw5TTl.png",
    favouriteAmount: 319,
    preparationTimeMs: 600_000,
    preparationTimeSeconds: 600
)
