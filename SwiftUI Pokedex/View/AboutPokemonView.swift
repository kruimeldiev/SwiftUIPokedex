//
//  AboutPokemonView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 24/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct AboutPokemonView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Height: \(self.viewModel.geselecteerdePokemon.height * 10) cm")
            
            Text("Weight: \(self.viewModel.geselecteerdePokemon.weight / 10) kg")
            
            ForEach(0..<self.viewModel.geselecteerdePokemon.types.count, id: \.self) { type in
                TypeView(type: self.viewModel.geselecteerdePokemon.types[type].type)
            }
            
            VStack(alignment: .leading) {
                ForEach(0..<self.viewModel.geselecteerdePokemon.stats.count, id: \.self) { stat in
                    StatView(stat: self.viewModel.geselecteerdePokemon.stats[stat])
                }
            }
            
            VStack {
                ForEach(0..<self.viewModel.geselecteerdePokemon.abilities.count, id: \.self) { ability in
                    AbilityView(viewModel: ViewModel(),
                                abilityURL: self.viewModel.geselecteerdePokemon.abilities[ability].ability.url,
                                weergegevenAbility: AbilityDetail(name: "default",
                                                                  flavor_text_entries: [Flavor_Text(flavor_text: "default")]))
                }
            }
        }
    }
}

struct AboutPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPokemonView()
    }
}
