//
//  ContentView.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 18/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            Button(action: {
                print(self.viewModel.volledigePokedex)
            }) {Text("Print")}
            
        }.onAppear {
            self.viewModel.volledigePokedexLaden()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
