//
//  GroupsItem.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 20.02.2022.
//

import Foundation



struct GroupsItems {
    var name: String
    var photo: String
}

extension GroupsItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "photo_50"
    }
}
