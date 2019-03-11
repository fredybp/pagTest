//
//  Requester.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 10/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum BeerError: Error {
    case badURL
    case badResponse
    case castError
}

typealias Handler = (Result<Data, BeerError>) -> Void

protocol BeerRequesterProtocol {
    func getBeers(page: Int, completion: @escaping Handler)
}

class BeerRequester: BeerRequesterProtocol {
    
    private let rawUrl = "https://api.punkapi.com/v2/beers?page="
    
    func getBeers(page: Int, completion: @escaping Handler) {
        
        guard let url = URL(string: "\(rawUrl)\(page)") else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(.failure(.badResponse))
            }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
