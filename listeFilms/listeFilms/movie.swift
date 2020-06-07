//
//  movie.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//
import Foundation

open class Movie: Codable, Identifiable, Equatable, Hashable, ObservableObject {

@Published public var id: Int
@Published public var nom: String
@Published public var idL: String
@Published public var note: Int
@Published public var isShow: Bool

enum CodingKeys: String, CodingKey {
    case id = "id"
    case nom = "nom"
    case idL = "idL"
    case note = "note"
    case isShow = "isShow"
}

public static func == (lhs: Movie, rhs: Movie) -> Bool {
    lhs.id == rhs.id
}

public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
}

public init(id: Int, nom: String, idL: String, note: Int, isShow: Bool) {
    self.id = id
    self.nom = nom
    self.idL = idL
    self.note = note
    self.isShow = isShow
}

public init() {
    self.id = UUID().hashValue
    self.nom = ""
    self.idL = ""
    self.note = 0
    self.isShow = false
}

public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: .id)
    self.nom = try container.decode(String.self, forKey: .nom)
    self.idL = try container.decode(String.self, forKey: .idL)
    self.note = try container.decode(Int.self, forKey: .note)
    self.isShow = try container.decode(Bool.self, forKey: .isShow)
}

public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(nom, forKey: .nom)
    try container.encode(idL, forKey: .idL)
    try container.encode(note, forKey: .note)
    try container.encode(isShow, forKey: .isShow)
}
}

