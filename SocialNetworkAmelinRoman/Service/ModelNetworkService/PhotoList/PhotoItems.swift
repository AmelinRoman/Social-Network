//
//  PhotoItems.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 21.02.2022.
//

import Foundation

struct PhotoItems {
    var sizes: [PhotoSizes]
}

extension PhotoItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case sizes = "sizes"
    }
}


