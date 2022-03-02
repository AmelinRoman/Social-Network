//
//  Response.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 19.02.2022.
//

import Foundation


struct CountUserResponse {
    var items: [FriendsItems]
}

extension CountUserResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
