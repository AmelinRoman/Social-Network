//
//  Response.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 05.04.2022.
//

import Foundation


struct Response<ItemsType: Decodable>: Decodable {
    let response: Items<ItemsType>
}
