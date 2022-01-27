//
//  FriendsLoaderService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 17.12.2021.
//

/*import UIKit


final class FriendsLoaderService: FriendsViewController {
    
    func loaderFriend() -> [SectionFriends] {
        
        let sortedArray = friendArray(arrayFriendsList)
        let sectionArray = sectionForFriends(sortedArray)
        return sectionArray
    }
}

private extension FriendsLoaderService {
    
    func friendArray(_ array: [Friends]) -> [Character: [Friends]] {
        var newArray: [Character: [Friends]] = [:]
        for user in array {
            guard let firstLetter = user.nameFriend.first else {
                continue
            }
            guard var array = newArray[firstLetter] else {
                let newValue = [user]
                newArray.updateValue(newValue, forKey: firstLetter)
                continue
            }
            array.append(user)
            newArray.updateValue(array, forKey: firstLetter)
        }
        return newArray
    }
    
    func sectionForFriends(_ array: [Character: [Friends]]) -> [SectionFriends] {
        
        var sections: [SectionFriends] = []
        for (key, array) in array {
            sections.append(SectionFriends(key: key, data: array))
        }
        sections.sort {$0 < $1}
        return sections
    }
}*/
