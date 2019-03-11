//
//  Beer.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 10/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let imageURL: String
    let abv: Double
    let ibu: Double?
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case imageURL = "image_url"
        case abv
        case ibu
        case description
    }
}
