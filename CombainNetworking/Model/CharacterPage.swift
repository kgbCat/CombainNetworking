//
//  CharacterPage.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

struct CharacterPage: Codable {

    var info: PageInfo
    var results: [Character]

    init(info: PageInfo, results: [Character]) {
        self.info = info
        self.results = results
    }
}
