//
//  PageInfo.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

struct PageInfo: Codable {

    var count: Int
    var pages: Int
    var prev: String?
    var next: String?

    init(count: Int, pages: Int, prev: String?, next: String?) {
        self.count = count
        self.pages = pages
        self.prev = prev
        self.next = next
    }
}
