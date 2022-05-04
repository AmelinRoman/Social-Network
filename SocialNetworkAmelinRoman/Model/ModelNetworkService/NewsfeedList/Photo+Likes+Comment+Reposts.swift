//
//  Photo+Likes+Comment+Reposts.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import Foundation


struct Attachment {
    
    let type: String?
    let photo: PhotoItems?
    let video: Video?
}

extension Attachment: Decodable {
    enum CodingKeys: String, CodingKey {
        case type
        case photo
        case video
    }
}

struct Likes {
    let count: Int
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}

struct Comments {
    let count: Int
}

extension Comments: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}

struct Reposts {
    let count: Int
}

extension Reposts: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}
