//
//  StatView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 27/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct StatView: View {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(.white))
                .clipShape(CustomCornerRadius(corner: [.topLeft, .topRight], radius: 20))
                .shadow(color: Color.black.opacity(0.2), radius: 10)
            
            VStack {
                ForEach(0..<self.pokemonVM.stats.count, id: \.self) { stat in
                    StatBarView(stat: self.pokemonVM.stats[stat])
                }
            }
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
