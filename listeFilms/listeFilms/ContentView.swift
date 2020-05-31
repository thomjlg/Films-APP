//
//  ContentView.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var userData: UserData

    @Binding var movie : Movie

    @State var note: Double = 0

    var body: some View {
        VStack{
            HStack{
                Text("Film :")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(self.movie.nom)
            }
            .padding([.leading, .bottom, .trailing], 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, -30.0/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(height: 60.0)
            
            VStack{
                Text("Film regardé : ")
                    .foregroundColor(movie.isShow ? .green : .red)
                Toggle("Film", isOn: self.$movie.isShow)
                    .onTapGesture {
                        self.userData.fetcher.save(movies: self.userData.movies)
                        self.movie.isShow = !self.movie.isShow
                        print(self.movie.isShow)
                }
                    .labelsHidden()
            }.padding(.vertical, 20.0)
                .padding(.horizontal, 70)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(movie.isShow ? .green : .red)
            )
            Spacer()
                .frame(height: 50)
            VStack{
                Slider(value: self.$note, in: 0...5, step: 1) { (changed) in
                    self.movie.note = Int(self.note)
                    self.userData.fetcher.save(movies: self.userData.movies)
                }
                .padding(.horizontal, 70.0)

                Text("Note de \(Int(self.movie.note)) / 5")
            }
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 50)
                            .padding(.vertical, -20)
                )

            Spacer()
            Spacer()
                
        }.padding(0.0).onAppear() {
            self.note = Double(self.movie.note)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movie: .constant(Movie(id: 1, nom: "A", idL: "B", note: 2, isShow: true)), note: 3)
        .environmentObject(MovieFetcher())
    }
}
