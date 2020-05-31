//
//  movie.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//
import Foundation

struct Movie: Decodable, Encodable, Identifiable {
    public var id: Int
    public var nom: String
    public var idL: String
    public var note: Int
    public var isShow: Bool

    enum CodingKeys: String, CodingKey {
           case id = "id"
           case nom = "nom"
           case idL = "idL"
           case note = "note"
           case isShow = "isShow"
        }
}

