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
        
        ZStack {
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    
                    Text(pokemonVM.specieFlavorTextZoeken())
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
                    
                    Text("Pokémon data:")
                        .font(Font.system(.callout).bold())
                        .foregroundColor(Color(self.pokemonVM.pokemonKleur))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Soort")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text(pokemonVM.specieGeneraZoeken())
                        }
                        HStack {
                            Text("Lengte")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text("\(pokemonVM.height * 10) cm")
                        }
                        HStack {
                            Text("Gewicht")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text("\(pokemonVM.weight / 10) kg")
                        }
                        HStack(alignment: .top) {
                            Text("Abilities")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(self.pokemonVM.abilities.indices) { ability in
                                    Text("\(ability + 1). \(self.pokemonVM.abilities[ability].ability.name.capitalized)")
                                }
                            }
                        }
                    }
                    
                    Text("Training data:")
                    .font(Font.system(.callout).bold())
                    .foregroundColor(Color(self.pokemonVM.pokemonKleur))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Vang kans")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text("\(pokemonVM.pokemonSpecie.capture_rate)")
                        }
                        HStack {
                            Text("Basis geluk")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text("\(pokemonVM.pokemonSpecie.base_happiness)")
                        }
                        HStack {
                            Text("Basis Exp.")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text("\(pokemonVM.base_experience)")
                        }
                        HStack(alignment: .top) {
                            Text("Groei snelheid")
                                .bold()
                                .frame(width: 120, alignment: .leading)
                            Text(pokemonVM.pokemonSpecie.growth_rate.name.capitalized)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct AboutPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPokemonView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
