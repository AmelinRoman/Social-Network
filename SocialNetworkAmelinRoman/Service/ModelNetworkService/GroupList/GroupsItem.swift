//
//  GroupsItem.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 20.02.2022.
//

import Foundation



struct GroupsItems {
    var id: Int
    var name: String
    var photo: String
}

extension GroupsItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case photo = "photo_50"
    }
}
