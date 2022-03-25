//
//  RealmPhoto.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 09.03.2022.
//

import Foundation
import RealmSwift

class RealmPhoto: Object {
    @Persisted (primaryKey: true) var url: String = ""
    @Persisted (indexed: true) var id: Int = 0
}

extension RealmPhoto {
    convenience init(ownerID: Int ,photo: Photo) {
        self.init()
        self.url = photo.photo
        self.id = ownerID
    }
}
