//
//  menu.swift
//  
//
//  Created by Thomas JAULGEY on 25/05/2020.
//

import SwiftUI

struct menu: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var fetcher = MovieFetcher()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack{
                    Text("on my SSD")
                        .foregroundColor(Color.green)
                        .padding(.leading, nil)
                    
                    Spacer()
                }
                List(fetcher.movies) { movie in
                VStack (alignment: .leading) {
                    NavigationLink(destination: ContentView()) {
                        Text(movie.nom)
                    }
                            
                    }.navigationBarTitle(Text("Films"))
                }
            }
        }
    }
}

struct menu_Previews: PreviewProvider {
    static var previews: some View {
        menu()
        .environmentObject(MovieFetcher())
    }
}
