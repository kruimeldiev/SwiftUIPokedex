//
//  Pokedex.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

struct Pokedex: Codable {
    var results: [PokedexEntry]
}

struct PokedexEntry: Codable {
    var name: String
    var url: String
}
