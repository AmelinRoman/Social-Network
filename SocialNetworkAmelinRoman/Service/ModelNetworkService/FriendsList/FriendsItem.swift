//
//  FriensItem.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 19.02.2022.
//

import Foundation


struct FriendsItems {
    var id: Int
    var firstName: String
    var lastName: String
    var photo: String
    
}

extension FriendsItems: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
    }
    
}
