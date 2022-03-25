//
//  SearchGroupsResponse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 22.02.2022.
//

import Foundation

// - MARK: Модель JSON groups.search
struct SearchGroupsResponse {
    var response: SearchCountResponse
}

extension SearchGroupsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response 
    }
}
