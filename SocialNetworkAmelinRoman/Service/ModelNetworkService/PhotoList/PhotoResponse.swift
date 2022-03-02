//
//  PhotoResponse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 21.02.2022.
//

import Foundation

// - MARK: Модель JSON photos.get
struct PhotoResponse {
    var response: CountResponse
}

extension PhotoResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
