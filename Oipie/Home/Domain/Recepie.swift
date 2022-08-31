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
    
    init(name: String, cover: String) {
        self.name = name
        self.cover = cover
    }
    
    func getName() -> String {
        return name
    }
    
    func getCover() -> String {
        return cover
    }
}
