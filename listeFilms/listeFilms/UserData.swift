//
//  UserData.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 29/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//


import SwiftUI
import Combine

final class UserData: ObservableObject  {

    var fetcher = MovieFetcher()

    @Published var movies = [Movie]()

    init() {
        fetcher.load { (movies) in
            if let movies = movies {
                self.movies = movies
            }
        }
    }

}
