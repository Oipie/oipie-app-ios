//
//  ApiPaginatedResponse.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Foundation

struct ApiPaginatedResponse<T: Codable>: Codable {
    let items: [T]
}
