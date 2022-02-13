//
//  Character.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

public struct Character: Codable {
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

    public var id: Int64
    public var name: String
    public var status: String
    public var species: String
    public var type: String
    public var gender: String
    public var image: String

    public init(id: Int64, name: String, status: String, species: String, type: String, gender: String, image: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
    }
}
