//
//  TypeView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 22/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct TypeView: View {
    
    @State var type: Type
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 80, height: 40)
                .cornerRadius(5)
                .foregroundColor(Color(self.getTypeKleur(type: self.type)))
            
            Text(self.type.name.capitalized)
                .padding(5)
        }
    }
    
    func getTypeKleur(type: Type) -> String {
        switch type.name {
        case "bug": return "BugTypeKleur"
        case "dragon": return "DragonTypeKleur"
        case "electric": return "ElectricTypeKleur"
        case "fighting": return "FightingTypeKleur"
        case "fire": return "FireTypeKleur"
        case "flying": return "FlyingTypeKleur"
        case "ghost": return "GhostTypeKleur"
        case "grass": return "GrassTypeKleur"
        case "ground": return "GroundTypeKleur"
        case "ice": return "IceTypeKleur"
        case "normal": return "NormalTypeKleur"
        case "poison": return "PoisonTypeKleur"
        case "psychic": return "PsychicTypeKleur"
        case "rock": return "RockTypeKleur"
        default: return "WaterTypeKleur"
        }
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type: Type(name: "default", url: "default"))
    }
}
