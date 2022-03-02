//
//  GroupsCount.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 20.02.2022.
//

import Foundation


struct CountGroupsResponse {
    var items: [GroupsItems]
}

extension CountGroupsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
