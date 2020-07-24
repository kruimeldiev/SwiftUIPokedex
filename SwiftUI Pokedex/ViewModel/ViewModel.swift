//
//  ViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var volledigePokedex: Pokedex
    @Published var pokedexArray: [PokemonURL]
    
    init() {
        volledigePokedex = Pokedex(results: [])
        pokedexArray = [PokemonURL(name: "default", url: "default")]
        volledigePokedexLaden()
    }
    
    func volledigePokedexLaden() {
        
        self.netwokringManager.getVolledigePokedex (completion: { (Pokedex) in
            // De data die terug komt uit de completion handeler wordt opgeslagen als volledigePokedex
            self.volledigePokedex = Pokedex
            
            // De data van de volledigePokedex wordt als Array opgeslagen in de pokedexArray
            self.pokedexArray = self.volledigePokedex.results
        })
    }
    
}
