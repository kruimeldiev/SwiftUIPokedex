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
        
            Rectangle()
                .foregroundColor(Color(.white))
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .clipShape(CustomCornerRadius(corner: [.topLeft, .topRight], radius: 20))
            
            VStack {
                
                Text(pokemonVM.specieFlavorTextZoeken())
                Text("Hoogte: \(pokemonVM.height * 10) cm")
                Text("Gewicht: \(pokemonVM.weight / 10) kg")
                
            }
        }
    }
}

struct CustomCornerRadius: Shape {
    
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}

struct AboutPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPokemonView(pokemonVM: PokemonViewModel(pokemonURL: "", specieURL: ""))
    }
}
