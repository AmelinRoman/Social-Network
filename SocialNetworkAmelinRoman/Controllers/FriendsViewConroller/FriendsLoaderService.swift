//
//  FriendsLoaderService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 17.12.2021.
//

import UIKit
import RealmSwift

extension FriendsViewController {
    
    func loadFriend(realm: Results<RealmFriends>?) -> [RealmFriends] {
        guard let realm = realm else {return friendsArrayRealm}
        friendsArrayRealm = Array(realm)
        return friendsArrayRealm
    }
}
