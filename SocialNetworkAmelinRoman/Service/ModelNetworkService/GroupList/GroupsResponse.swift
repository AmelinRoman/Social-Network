//
//  GroupList.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 20.02.2022.
//

import Foundation

// - MARK: Модель JSON groups.get
struct GroupsResponse {
    var response: CountGroupsResponse
}

extension GroupsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
