//
//  Video.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 02.05.2022.
//

import Foundation

struct Video: Codable {
    let videoDescription: String
    let duration: Int
    let image: [Size]
    let title: String
    let type: String
    let views: Int
    
    enum CodingKeys: String, CodingKey {
        case videoDescription = "description"
        case duration, image
        case title
        case type, views
    }
}

struct Size: Codable {
    let height: Int
    let url: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height, width, url
    }
}
