//
//  ContentView.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetcher = MovieFetcher()

    var body: some View {
        
        VStack {
            NavigationView{
                List(fetcher.movies) { movie in
                    VStack (alignment: .leading) {
                        Text(movie.name)
                            .font(.system(size: 18))
                        Text(movie.released)
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)
                    }
                }.navigationBarTitle(Text("Liste des Films"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
