//
//  RealmGroups.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 09.03.2022.
//

import Foundation
import RealmSwift

class RealmGroups: Object {
    @Persisted (primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var photo: String = ""
    
    
}

extension RealmGroups {
    convenience init(groups: GroupsItems) {
        self.init()
        self.name = groups.name
        self.photo = groups.photo
        self.id = groups.id
    }
}
