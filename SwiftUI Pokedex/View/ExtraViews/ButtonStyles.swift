//
//  ButtonStyles.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 11/08/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct DetailViewButton: View {
    
    var knopText: String
    var ingedrukt: Bool
    
    var body: some View {
        
        ZStack {
            if ingedrukt {
                Image("pokebal-vector")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .blur(radius: 1)
                    .opacity(0.1)
            }
            
            Text(knopText)
                .foregroundColor(ingedrukt ? Color.white : Color.white.opacity(0.5)).animation(.easeInOut)
                .font(Font.system(size: 25, weight: .bold))
        }
    }
}

struct PressableButton: View {
    
    var knopText: String
    var ingedrukt: Bool
    
    var body: some View {
        ZStack {
            if ingedrukt {
                Image("pokebal-vector")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .blur(radius: 1)
                    .opacity(0.15)
                Text(knopText)
                    .foregroundColor(.white)
                    .font(Font.system(size: 30, weight: .bold))
            } else {
                Text(knopText)
                    .foregroundColor(.white)
                    .font(Font.system(size: 30, weight: .bold))
                    .opacity(0.7)
            }
        }
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.red)
            HStack(spacing: 60) {
                DetailViewButton(knopText: "About", ingedrukt: true)
                PressableButton(knopText: "Stats", ingedrukt: false)
            }
        }
    }
}
