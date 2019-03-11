//
//  Caster.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 10/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import Foundation

class Caster {
    
    private var beerRequester: BeerRequesterProtocol
    
    init(requester: BeerRequesterProtocol) {
        beerRequester = requester
    }
    
    func getBeers(page: Int, successCompletion: @escaping ([Beer]) -> (), failureCompletion: @escaping (BeerError) -> ()) {
        beerRequester.getBeers(page: page) { (result) in
            switch result {
            case .success(let data):
                do {
                    let beers = try JSONDecoder().decode([Beer].self, from: data)
                    successCompletion(beers)
                } catch {
                    failureCompletion(BeerError.castError)
                }
                break
            case .failure(let error):
                failureCompletion(error)
                break
            }
        }
    }
    
}
