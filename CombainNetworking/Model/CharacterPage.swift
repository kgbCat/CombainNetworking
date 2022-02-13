//
//  CharacterPage.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

public struct CharacterPage: Codable {

    public var info: PageInfo
    public var results: [Character]

    public init(info: PageInfo, results: [Character]) {
        self.info = info
        self.results = results
    }
}
