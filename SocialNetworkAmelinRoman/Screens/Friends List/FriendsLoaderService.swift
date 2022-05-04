//
//  FriendsLoaderService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 17.12.2021.
//

import UIKit
import RealmSwift

extension FriendsViewController {
    
    func networkReqest() {
        networkService.fetch(type: .userFriends) { [weak self] result in
            switch result {
            case .success(let friends):
                let items = friends.map { RealmFriends(friends: $0)}
                DispatchQueue.main.async {
                    do{
                        try RealmService.save(items: items)
                        self?.friendsRealm = try RealmService.load(typeOf: RealmFriends.self)
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadFriend(realm: Results<RealmFriends>?) -> [RealmFriends] {
        guard let realm = realm else {return friendsArrayRealm}
        friendsArrayRealm = Array(realm)
        return friendsArrayRealm
    }
}
