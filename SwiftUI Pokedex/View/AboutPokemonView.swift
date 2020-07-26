//
//  AboutPokemonView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct AboutPokemonView: View {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    var body: some View {
        
        VStack {
            
            Text("Hoogte: \(pokemonVM.height * 10) cm")
            Text("Gewicht: \(pokemonVM.weight / 10) kg")
            
        }
    }
}

struct AboutPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPokemonView(pokemonVM: PokemonViewModel(url: ""))
    }
}
