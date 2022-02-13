//
//  Episode.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/13/22.
//

import Foundation

struct Episode: Codable {
    var description: String {
"""
        self.id = \(id)
        self.name = \(name)
        self.air_date = \(air_date)
        self.created = \(created)
        self.episode = \(episode)
        self.characters = \(characters)
        self.url = \(url)
"""
    }

    var id: Int64
    var name: String
    var air_date: String
    var episode: String
    var created: String
    var characters: [URL]
    var url: String

    init(id: Int64, name: String, air_date: String, episode: String, created: String, characters:[URL], url: String) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.created = created
        self.episode = episode
        self.url = url
        self.characters = characters
    }
}

