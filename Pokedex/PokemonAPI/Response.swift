//
//  Response.swift
//  Pokedex
//
//  Created by Chris Eadie on 26/11/2020.
//

import Foundation

struct PokemonAPIResponse: Codable {
    let count: Int
    let next, previous: String?
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}

struct Result: Codable {
    let name: String
    let url: String
}
