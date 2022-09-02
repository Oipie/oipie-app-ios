//
//  ApiClient.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

import Combine
import Foundation

class ApiClient {
    private func getBaseComponents(_ path: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "deleteme.deno.dev"
        components.path = path
        return components
    }

    func getRecepies(limit: Int, offset: Int) -> AnyPublisher<ApiPaginatedResponse<ApiRecepie>, Error> {
        var components = getBaseComponents("/api/v1/recepies")

        components.queryItems = [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset)),
        ]

        return components.url
            .publisher
            .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
            .tryMap(mapErrors)
            .decode(type: ApiPaginatedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func mapErrors(element: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }
        return element.data
    }
}
