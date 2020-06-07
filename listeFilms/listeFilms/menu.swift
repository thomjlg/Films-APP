//
//  menu.swift
//  
//
//  Created by Thomas JAULGEY on 25/05/2020.
//

import SwiftUI

struct menu: View {
    @EnvironmentObject var userData: UserData
    @State var showShowOnly = false
    @State private var searchText = ""
//    @ObservedObject var movie: Movie
    
    var body: some View {
        NavigationView {
            VStack {
                
                if self.userData.movies.count > 0 {
                    List{
                        HStack{
                            Toggle("Uniquement les films non vu", isOn: self.$showShowOnly)
                                .padding(.horizontal, 20.0)
                                .padding(.vertical, 10.0)
                                .foregroundColor(Color(red:0.2, green:0.6, blue:0.8))
                        }
                        
//                        ForEach(0..<self.userData.movies.filter{ self.showShowOnly ? $0.isShow == !self.showShowOnly : true }.count, id: \.self) { movieIndex in
//                            VStack (alignment: .leading) {
//                                NavigationLink(destination: ContentView(movie: self.$userData.movies[movieIndex])) {
//                                    Text(self.userData.movies[movieIndex].nom)
//                                }
//
//                            }}
                        
                        ForEach(self.userData.movies.filter{ self.showShowOnly ? $0.isShow == !self.showShowOnly : true }) { movie in
                            VStack (alignment: .leading) {
                                NavigationLink(destination: ContentView(movie: movie)) {
                                    Text(movie.nom)
                                }
                            }
                        }
                        
                        
                    }.navigationBarTitle(Text("Films"))
                }
            }
            HStack{
                VStack{
                    HStack{
                        Text("Liste des films présents sur le disque dur")
                            .font(.headline)
                        Spacer()
                    }
                    VStack{
                        HStack{
                            Text("\nPossibilité de renseigner si un film a été vu.\nPossibilité de noter un film (sur 10).")
                                .font(.subheadline)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            .padding(.leading, 50.0)
        }
    }
}


struct menu_Previews: PreviewProvider {
    static var previews: some View {
        menu()
        .environmentObject(MovieFetcher())
    }
}
