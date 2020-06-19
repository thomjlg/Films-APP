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
    @State var showfilters = false
    
    
    
    var Filters: some View {
        VStack{
            
            Toggle("Uniquement les films non vu", isOn: self.$showShowOnly)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .foregroundColor(Color(red:0.2, green:0.6, blue:0.8))
            
            Toggle("Uniquement les films vu", isOn: self.$showShowOnly)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .foregroundColor(Color(red:0.2, green:0.6, blue:0.8))
            
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                if self.userData.movies.count > 0 {
                    List{
                        HStack{
                            Button(action: {self.showfilters.toggle()}) {
                                Text("Filtres")
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                            }.sheet(isPresented: $showfilters) {
                                self.Filters
                            }
                            
                        }
                     
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
