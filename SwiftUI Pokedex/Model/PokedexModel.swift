//
//  PokedexModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    var results: [PokemonResult]
}

struct PokemonResult: Decodable {
    var name: String
    var url: String
}
