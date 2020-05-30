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
    @Published var isShow: Bool = false
    @Published var note: Double = 0
    @Published var movies = [Movie]()
}
