//
//  PokemonViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon = Pokemon(abilities: [],
                                     base_experience: 0,
                                     height: 0,
                                     id: 0,
                                     name: "",
                                     species: SpeciesURL(url: ""),
                                     sprites: Sprite(front_default: ""),
                                     stats: [],
                                     types: [],
                                     weight: 0)
    
    @Published var pokemonSpecie = PokemonSpecies(base_happiness: 0,
                                                  capture_rate: 0,
                                                  growth_rate: Growth_Rate(name: ""),
                                                  habitat: Habitat(name: ""),
                                                  flavor_text_entries: [],
                                                  genera: [])
    
    // De init zorgt ervoor dat de juiste pokemon data wordt gebruikt wanneer de PokemonViewModel wordt aangeroepen
    init(pokemonURL: String, specieURL: String) {
        pokemonLaden(url: pokemonURL)
        specieLaden(url: specieURL)
    }
    
    var abilities: [Ability] {
        return self.pokemon.abilities
    }
    
    var base_experience: Int {
        return self.pokemon.base_experience
    }
    
    var height: Int {
        return self.pokemon.height
    }
    
    var id: Int {
        return self.pokemon.id
    }
    
    var name: String {
        return self.pokemon.name
    }
    
    var species: SpeciesURL {
        return self.pokemon.species
    }
    
    var sprites: Sprite {
        return self.pokemon.sprites
    }
    
    var stats: [Stat] {
        return self.pokemon.stats
    }
    
    var types: [Types] {
        return self.pokemon.types
    }
    
    var weight: Int {
        return self.pokemon.weight
    }
    
    var pokemonKleur: String {
        if self.pokemon.types.count > 0 {
            return "\(self.pokemon.types[0].type.name.capitalized)TypeKleur"
        } else {
            return "NormalTypeKleur"
        }
    }
    
    // Deze functie roept de NetworkingManager aan om een Pokemon uit de API te downloaden
    func pokemonLaden(url: String) {
        NetworkingManager().getSpecifiekePokemon(url: url) { (pokemon) in
            self.pokemon = pokemon
        }
    }
    
    // Deze functie roept de NetworkingManager aan om de Species van de Pokemon te downloaden uit de API om deze vervolgens weer te geven in de PokemonViewModel
    func specieLaden(url: String) {
        NetworkingManager().getPokemonSpecies(url: url) { (specie) in
            self.pokemonSpecie = specie
        }
    }
    
    // Deze functie zoekt de juiste flavor_text van de Pokemon en stuurt deze terug als een String return type
    func specieFlavorTextZoeken() -> String {
        
        // De index is de eerste instantie van de flavor_text_entries waar de taal Engels is en de tekst uit het Pokémon Emerald spel komt
        if let index = self.pokemonSpecie.flavor_text_entries.first(where: { $0.language.name == "en" && $0.version.name == "emerald" }) {
            return index.flavor_text
        } else {
            return "Fout: er is geen flavor text gevonden."
        }
    }
    
    // Deze functie zoekt de juiste genera (Pokémon soort) van de Pokémon en stuurt deze terug als een String
    func specieGeneraZoeken() -> String {
        if let index = self.pokemonSpecie.genera.first(where: { $0.language.name == "en" }) {
            return index.genus
        } else {
            return "Geen data gevonden"
        }
    }
    
}
