//
//  NetworkingError.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation

enum NetworkingError: LocalizedError {

     case unreachableAddress(url: URL)
     case invalidResponse

     var errorDescription: String? {
         switch self {
         case .unreachableAddress(let url): return "\(url.absoluteString) is unreachable"
         case .invalidResponse: return "Response with mistake"
         }
     }
}

