//
//  PhotoCount.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 21.02.2022.
//

import Foundation

// MARK: CountResponse
// - Model JSON
struct CountResponse {
    var items: [PhotoItems]
}

extension CountResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case items
    }
}
