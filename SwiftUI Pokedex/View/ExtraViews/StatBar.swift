//
//  StatBar.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 22/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct StatBar: View {
    
    var stat: Stat
    var pokemonKleur: String
    
    var body: some View {
        
        HStack {
            
            Text(self.getStatName(stat: self.stat))
                .bold()
                .frame(width: 100, alignment: .leading)
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .frame(width: 180, height: 20)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray.opacity(0.1))
                
                Rectangle()
                    .frame(width: CGFloat(stat.base_stat), height: 20)
                    .cornerRadius(10)
                    .foregroundColor(Color(pokemonKleur))
            }
            
            Text("\(stat.base_stat)")
            
        }
    }
    
    func getStatName(stat: Stat) -> String {
        switch stat.stat.name {
        case "hp": return "HP"
        case "attack": return "Attack"
        case "defense": return "Defense"
        case "special-attack": return "Spec. Att."
        case "special-defense": return "Spec. Def."
        case "speed": return "Speed"
        default: return "Error"
        }
    }
}
