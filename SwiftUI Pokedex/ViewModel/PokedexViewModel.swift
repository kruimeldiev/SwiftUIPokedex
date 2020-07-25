//
//  PokedexViewModel.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import Foundation

class PokedexViewModel: ObservableObject {
    
    @Published var pokedex = [PokedexEntryViewModel]()
    
    init() {
        NetworkingManager().getVolledigePokedex { (pokedex) in
            self.pokedex = pokedex.results.map(PokedexEntryViewModel.init)
        }
    }
}

struct PokedexEntryViewModel {
    
    var pokedexEntry: PokedexEntry
    
    init(entry: PokedexEntry) {
        self.pokedexEntry = entry
    }
    
    var name: String {
        return self.pokedexEntry.name
    }
    
    var url: String {
        return self.pokedexEntry.url
    }
    
}
