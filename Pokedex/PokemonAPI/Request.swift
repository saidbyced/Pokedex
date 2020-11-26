//
//  Request.swift
//  Pokedex
//
//  Created by Chris Eadie on 26/11/2020.
//

import UIKit

struct PokemonAPI {
    let scheme = "https"
    let host = "pokeapi.co"
    let path = "/api/v2/pokemon/"
    var offset = ""
    var limit = ""
    
    var url: URL? {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = self.scheme
//        urlComponents.host = self.host
//        urlComponents.path = self.path
//
//        let url = urlComponents.url
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        
        return url
    }
}
