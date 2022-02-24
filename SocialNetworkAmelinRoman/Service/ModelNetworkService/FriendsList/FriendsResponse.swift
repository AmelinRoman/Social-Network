//
//  FriendsList.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 19.02.2022.
//

import Foundation

// - MARK: Модель JSON friends.get
struct FriendsResponse {
    var response: CountUserResponse
}

extension FriendsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
