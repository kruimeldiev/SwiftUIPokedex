//
//  PokemonDetailView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 21/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text("#\(pokemonVM.id)")
            Text(pokemonVM.name.capitalized)
            
            VStack {
            
                Text("Hoogte: \(pokemonVM.height * 10) cm")
                Text("Gewicht: \(pokemonVM.weight / 10) kg")
            
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonVM: PokemonViewModel(url: ""))
    }
}
