//
//  ApiRecepie.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Foundation

struct ApiRecepie: Codable {
    let name: String
    let cover: String
    let favouriteAmount: Int
    let preparationTime: Int
}
