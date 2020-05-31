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
    @ObservedObject var fetcher = MovieFetcher()
    @State var isShow: Bool = false
    @State var note: Double = 0
    
    var body: some View {
        VStack{
            VStack{
        Text("Film regardé : ")
                   .foregroundColor(fetcher.isShow ? .green : .red)
               Toggle("Film", isOn: $fetcher.isShow)
                   .labelsHidden()
            }.padding(.vertical, 20.0)
                .padding(.horizontal, 70)
           .overlay(
               RoundedRectangle(cornerRadius: 15)
                   .stroke(lineWidth: 2)
                   .foregroundColor(fetcher.isShow ? .green : .red)
           )
            Spacer()
            VStack{
                Slider(value: $fetcher.note, in: 0...5, step: 1)
                    .padding(.horizontal, 70.0)
                    
                
                Text("Note de \(Int(fetcher.note)) / 5")
            }
           
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movie: .constant(Movie(id: 1, nom: "A", idL: "B", note: 2, isShow: true)), note: 3)
        .environmentObject(MovieFetcher())
    }
}
