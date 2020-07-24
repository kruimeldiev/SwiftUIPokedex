//
//  PokemonModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    var abilities: [Ability]
    var height: Int
    var id: Int
    var name: String
    var species: SpeciesURL
    var sprites: Sprite
    var stats: [Stat]
    var types: [Types]
    var weight: Int
}

struct SpeciesURL: Decodable {
    var url: String
}

struct PokemonSpecies: Decodable {
    var flavor_text_entries: [Flavor_Text]
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

struct Flavor_Text: Decodable {
    var flavor_text: String
}
