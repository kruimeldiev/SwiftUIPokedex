//
//  DetailViewButton.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 04/08/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct DetailViewButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .accentColor(.white)
            .background(Image("pokebal-vector"))
            .foregroundColor(.white)
    }
}
