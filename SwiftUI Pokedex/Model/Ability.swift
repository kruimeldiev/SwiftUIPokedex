//
//  Ability.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 23/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Ability: Decodable {
    var ability: AbilityURL
}

struct AbilityURL: Decodable {
    var name: String
    var url: String
}

struct AbilityDetail: Decodable {
    var name: String
    var flavor_text_entries: [Ability_Flavor_Text]
}

struct Ability_Flavor_Text: Decodable {
    var flavor_text: String
    var language: Language
    var version_group: Game_Version
}
