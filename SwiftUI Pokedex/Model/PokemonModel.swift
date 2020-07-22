//
//  Pokedex.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    var results: [PokemonURL]
}

struct PokemonURL: Decodable {
    var name: String
    var url: String
}

struct Pokemon: Decodable {
    //var abilities: []
    var height: Int
    var id: Int
    var name: String
    var sprites: Sprite
    var stats: [Stat]
    var types: [Types]
    var weight: Int
}

struct Sprite: Decodable {
    var front_default: String
}

struct Types: Decodable {
    var type: Type
}

struct Type: Decodable {
    var name: String
    var url: String
}

struct Stat: Decodable {
    var base_stat: Int
    var stat: StatURL
}

struct StatURL: Decodable {
    var name: String
    var url: String
}
