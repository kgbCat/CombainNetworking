//
//  ViewModel.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import Foundation
import Combine


class ViewModel {
    let apiClient: ApiClient
    let character: AnyPublisher<Character, NetworkingError>
    let location: AnyPublisher<Location, NetworkingError>
    let episode: AnyPublisher<Episode, NetworkingError>

    internal init(apiClient: ApiClient, inputIdPublisher: AnyPublisher<Int, Never> ) {
        self.apiClient = apiClient
        self.character = inputIdPublisher.map{apiClient.character(id: $0)}.switchToLatest().eraseToAnyPublisher()
        self.location = inputIdPublisher.map{apiClient.location(id: $0)}.switchToLatest().eraseToAnyPublisher()
        self.episode = inputIdPublisher.map{apiClient.episode(id: $0)}.switchToLatest().eraseToAnyPublisher()
    }

//    func fetchCharactersWith(ids: [Int]) -> AnyPublisher<Character, NetworkingError> {
//        apiClient.mergedCharacters(ids: ids)
//    }
//
//    func fetchLocationsWith(ids: [Int]) -> AnyPublisher<Location, NetworkingError> {
//        apiClient.mergedLocations(ids: ids)
//    }
//
//    func fetchEpisodesWith(ids: [Int]) -> AnyPublisher<Episode, NetworkingError> {
//        apiClient.mergedEpisodes(ids: ids)
//    }
}
