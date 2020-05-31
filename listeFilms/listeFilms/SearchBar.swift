//
//  SearchBar.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 31/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

     @Binding var text: String

     class Coordinator: NSObject, UISearchBarDelegate {

         @Binding var text: String

         init(text: Binding<String>) {
             _text = text
         }

         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             text = searchText
         }
     }

     func makeCoordinator() -> SearchBar.Coordinator {
         return Coordinator(text: $text)
     }

     func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
         let searchBar = UISearchBar(frame: .zero)
         searchBar.delegate = context.coordinator
         searchBar.searchBarStyle = .minimal
        searchBar.placeholder=" Rechercher un film..."
        searchBar.autocapitalizationType = .none
         return searchBar
     }

     func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
         uiView.text = text
     }
 }
