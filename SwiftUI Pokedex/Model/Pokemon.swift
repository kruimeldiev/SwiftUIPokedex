//
//  Pokemon.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    var abilities: [Ability]
    var base_experience: Int
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
    var base_happiness: Int
    var capture_rate: Int
    var growth_rate: Growth_Rate
    var habitat: Habitat
    var flavor_text_entries: [Specie_Flavor_Text]
    var genera: [Genera]
}

struct Growth_Rate: Decodable {
    var name: String
}

struct Habitat: Decodable {
    var name: String
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

struct Specie_Flavor_Text: Decodable {
    var flavor_text: String
    var language: Language
    var version: Game_Version
}

struct Language: Decodable {
    var name: String
}

struct Game_Version: Decodable {
    var name: String
    var url: String
}

struct Genera: Decodable {
    var genus: String
    var language: Language
}
