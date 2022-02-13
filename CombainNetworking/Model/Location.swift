//
//  Location.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/13/22.
//

import Foundation

struct Location: Codable {
    var description: String {
"""
        self.id = \(id)
        self.name = \(name)
        self.dimension = \(dimension)
        self.created = \(created)
        self.type = \(type)
        self.residents = \(residents)
        self.url = \(url)
"""
    }

    var id: Int64
    var name: String
    var type: String
    var dimension: String
    var created: String
    var residents: [URL]
    var url: String

    init(id: Int64, name: String, type: String, dimention: String, created: String, residents:[URL], url: String) {
        self.id = id
        self.name = name
        self.dimension = dimention
        self.created = created
        self.type = type
        self.url = url
        self.residents = residents
    }
}

