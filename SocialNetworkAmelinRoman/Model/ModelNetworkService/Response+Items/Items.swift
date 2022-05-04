//
//  Items.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 05.04.2022.
//

import Foundation


struct Items<ItemsType: Decodable>: Decodable {
    let items: [ItemsType]
    let count: Int?
}
