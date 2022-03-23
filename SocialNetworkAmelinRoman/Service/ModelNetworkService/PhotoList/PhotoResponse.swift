//
//  PhotoResponse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 21.02.2022.
//

import Foundation

// - MARK: PhotoResponse
// - Model JSON
struct PhotoResponse {
    var response: CountResponse
}

extension PhotoResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
