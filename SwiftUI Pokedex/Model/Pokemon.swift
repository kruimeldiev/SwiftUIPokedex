//
//  Pokemon.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
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

struct SpeciesURL: Codable {
    var url: String
}

struct PokemonSpecies: Codable {
    var flavor_text_entries: [Flavor_Text]
}

struct Sprite: Codable {
    var front_default: String
}

struct Types: Codable {
    var type: Type
}

struct Type: Codable {
    var name: String
    var url: String
}

struct Stat: Codable {
    var base_stat: Int
    var stat: StatURL
}

struct StatURL: Codable {
    var name: String
    var url: String
}

struct Flavor_Text: Codable {
    var flavor_text: String
}
