//
//  RealmFriends.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.03.2022.
//
/*var firstName: String
var lastName: String
var photo: String*/


import Foundation
import RealmSwift


class RealmFriends: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted var photo: String = ""
    @Persisted var fullName: String = ""
}

extension RealmFriends {
    convenience init(friends: FriendsItems) {
        self.init()
        self.id = friends.id
        self.photo = friends.photo
        self.firstName = friends.firstName
        self.lastName = friends.lastName
        self.fullName = "\(friends.firstName)"+" "+"\(friends.lastName)"
    }
}
