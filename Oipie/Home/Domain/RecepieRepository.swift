//
//  RecepieRepository.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Combine
import Foundation

protocol RecepieRepository {
    func find(limit: Int, offset: Int) -> AnyPublisher<[Recepie], Error>
}
