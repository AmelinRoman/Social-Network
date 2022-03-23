//
//  RealmSearhGroups.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 09.03.2022.
//

import Foundation
import RealmSwift

class RealmSearhGroups: Object {
    @Persisted (primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var photo: String = ""
    
}

extension RealmSearhGroups {
    convenience init(searchText: String,searhGroups: SearchGroupsItems) {
        self.init()
        self.id = searhGroups.id
        self.name = searchText
        self.photo = searhGroups.photo
    }
}
