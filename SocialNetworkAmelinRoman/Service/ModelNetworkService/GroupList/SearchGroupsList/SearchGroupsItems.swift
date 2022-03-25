//
//  SearchGroupsItems.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 22.02.2022.
//

import Foundation


struct SearchGroupsItems {
    var id: Int
    var name: String
    var photo: String
}

extension SearchGroupsItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case photo = "photo_50"
    }
}
