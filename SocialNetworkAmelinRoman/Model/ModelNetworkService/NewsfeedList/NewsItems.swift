//
//  NewsItems.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import Foundation


struct NewsItems {
    
    let sourceID: Int
    let date: Double
    var text: String?
    let attachments: [Attachment]?
    let likes: Likes?
    let comments: Comments?
    let reposts: Reposts?
}

extension NewsItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case text
        case attachments = "attachments"
        case likes
        case comments
        case reposts
    }
}
