//
//  SearchCountResponse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 22.02.2022.
//

import Foundation


struct SearchCountResponse {
    var items: [SearchGroupsItems]
}

extension SearchCountResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case items
    }
}
