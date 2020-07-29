//
//  SearchBar.swift
//  SwiftUI Pokedex
//
//  Created by Casper Daris on 29/07/2020.
//  Copyright © 2020 Casper Daris. All rights reserved.
//

import SwiftUI
import Foundation

// Een UIViewRepresentable is een UIKit object, waarvan je de methodes kan gebruiken in SwiftUI
struct SearchBar: UIViewRepresentable {
    
    @Binding var zoekText: String
    
    // De coordinator zorgt ervoor dat de ContentView en de UIKit SearchBar kunnen samenwerken
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var userInputText: String
        
        // Deze initializer pakt de user input van de ContentView(pokemonZoekText) en maakt hier een Bindable String van
        init(userInput: Binding<String>) {
            _userInputText = userInput
        }
        
        // Deze functie zorgt ervoor dat de Bindable userInputText wordt geupdate wanneer de gebruiker nieuwe input geeft
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            userInputText = searchText
        }
        
    }
    
    // Deze functie zorgt ervoor dat de Coordinator klasse wordt gelinkt aan de SearchBar
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(userInput: $zoekText)
    }
    
    // Deze functie is verantwoordleijk voor het maken van de SearchBar in de ContentView
    // Door het instellen van de return type als UISearchBar, krijgt de ContentView een UISearchBar
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        
        // Maken van de SearchBar
        let searchBar = UISearchBar(frame: .zero)
        //
        searchBar.delegate = context.coordinator
        // return de gemaakte SearchBar
        return searchBar
    }
    
    // Deze functie update de UISearchBar met userInput(zoekText) van de gebruiker
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = zoekText
    }
    
}
