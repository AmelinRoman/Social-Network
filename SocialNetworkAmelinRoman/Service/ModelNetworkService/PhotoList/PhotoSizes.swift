//
//  PhotoSizes.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 21.02.2022.
//

import Foundation

// MARK: PhotoSizes
// - Model JSON
struct PhotoSizes {
    var type: String
    var url: String
}

extension PhotoSizes: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }
}

