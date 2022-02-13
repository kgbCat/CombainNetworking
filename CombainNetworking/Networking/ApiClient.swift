//
//  ApiClient.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation
import  Combine

struct ApiClient  {

    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "APIClient", qos: .default, attributes: .concurrent)

    // MARK: Characters API
    func character(id: Int) -> AnyPublisher<Character, NetworkingError> {
         return URLSession.shared
             .dataTaskPublisher(for: Method.character(id).url)
             .receive(on: queue)
             .map(\.data)
             .decode(type: Character.self, decoder: decoder)
             .mapError({ error -> NetworkingError in
                 switch error {
                 case is URLError:
                   return NetworkingError.unreachableAddress(url: Method.character(id).url)
                 default:
                   return NetworkingError.invalidResponse }
             })
//             .catch { _ in Empty<Character, NetworkingError>() }
             .eraseToAnyPublisher()
    }
    func mergedCharacters(ids: [Int]) -> AnyPublisher<Character, NetworkingError> {
         precondition(!ids.isEmpty)

         let initialPublisher = character(id: ids[0])
         let remainder = Array(ids.dropFirst())

         return remainder.reduce(initialPublisher) { (combined, id) in
             return combined
                 .merge(with: character(id: id))
                 .eraseToAnyPublisher()
         }
     }
    // MARK: Location API
    func location(id:Int) -> AnyPublisher<Location, NetworkingError>{
        return URLSession.shared
            .dataTaskPublisher(for: Method.location(id).url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Location.self, decoder: decoder)
            .mapError({ error -> NetworkingError in
                switch error {
                case is URLError:
                  return NetworkingError.unreachableAddress(url: Method.location(id).url)
                default:
                  return NetworkingError.invalidResponse }
            })
            .eraseToAnyPublisher()
    }

    func mergedLocations(ids: [Int]) -> AnyPublisher<Location, NetworkingError> {
         precondition(!ids.isEmpty)

         let initialPublisher = location(id: ids[0])
         let remainder = Array(ids.dropFirst())

         return remainder.reduce(initialPublisher) { (combined, id) in
             return combined
                 .merge(with: location(id: id))
                 .eraseToAnyPublisher()
         }
     }

    // MARK: Episode API
    func episode(id:Int) -> AnyPublisher<Episode, NetworkingError>{
        return URLSession.shared
            .dataTaskPublisher(for: Method.episode(id).url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Episode.self, decoder: decoder)
            .mapError({ error -> NetworkingError in
                switch error {
                case is URLError:
                  return NetworkingError.unreachableAddress(url: Method.episode(id).url)
                default:
                  return NetworkingError.invalidResponse }
            })
            .eraseToAnyPublisher()
    }

    func mergedEpisodes(ids: [Int]) -> AnyPublisher<Episode, NetworkingError> {
         precondition(!ids.isEmpty)

         let initialPublisher = episode(id: ids[0])
         let remainder = Array(ids.dropFirst())

         return remainder.reduce(initialPublisher) { (combined, id) in
             return combined
                 .merge(with: episode(id: id))
                 .eraseToAnyPublisher()
         }
     }
}
