//
//  StatBarView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 22/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct StatBarView: View {
    
    var stat: Stat
    
    var body: some View {
        
        HStack {
            
            Text(self.getStatName(stat: self.stat))
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .frame(width: 200, height: 10)
                    .cornerRadius(10)
                    .foregroundColor(Color.blue)
                
                Rectangle()
                    .frame(width: CGFloat(stat.base_stat), height: 10)
                    .cornerRadius(10)
                    .foregroundColor(Color.red)
                
            }
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

struct StatBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatBarView(stat: Stat(base_stat: 50, stat: StatURL(name: "default", url: "default")))
    }
}
