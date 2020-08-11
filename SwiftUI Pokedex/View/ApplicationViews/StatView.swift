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
                .clipShape(CustomCornerRadius(corner: [.topLeft, .topRight], radius: 10))
                .shadow(color: Color.black.opacity(0.2), radius: 5)
            
            ScrollView(showsIndicators: false) {
                
                VStack (alignment: .leading, spacing: 25){
                    
                    Text("Basis statistieken:")
                        .font(Font.system(.callout).bold())
                        .foregroundColor(Color(self.pokemonVM.pokemonKleur))
                        .padding(.top, 20)
                    
                    VStack (alignment: .leading, spacing: 40){
                        ForEach(0..<self.pokemonVM.stats.count, id: \.self) { stat in
                            StatBar(stat: self.pokemonVM.stats[stat], pokemonKleur: self.pokemonVM.pokemonKleur)
                        }
                    }
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
