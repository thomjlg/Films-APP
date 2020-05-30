//
//  menu.swift
//  
//
//  Created by Thomas JAULGEY on 25/05/2020.
//

import SwiftUI

struct menu: View {
    @EnvironmentObject var userData: UserData

    var body: some View {

        NavigationView {
            VStack {
                HStack{
                    Text("sur mon disque dur")
                        .foregroundColor(Color.green)
                        .padding(.leading, nil)

                    Spacer()
                }
                if self.userData.movies.count > 0 {
                    List(0..<self.userData.movies.count, id: \.self) { movieIndex in
                        VStack (alignment: .leading) {
                            NavigationLink(destination: ContentView(movie: self.$userData.movies[movieIndex])) {
                                Text(self.userData.movies[movieIndex].nom)
                            }

                        }.navigationBarTitle(Text("Liste des Films"))
                    }
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
