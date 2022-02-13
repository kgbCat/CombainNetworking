//
//  Character.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

struct Character: Codable {
    var description: String {
"""
        self.id = \(id)
        self.name = \(name)
        self.status = \(status)
        self.species = \(species)
        self.type = \(type)
        self.gender = \(gender)
        self.image = \(image)
"""
    }

    var id: Int64
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String

    init(id: Int64, name: String, status: String, species: String, type: String, gender: String, image: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
    }
}
