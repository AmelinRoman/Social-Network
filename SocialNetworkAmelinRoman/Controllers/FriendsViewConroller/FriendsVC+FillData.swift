//
//  FriendsVC+FillData.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Расширение класса для работы с данными всех друзей
extension FriendsViewController {
    
    func myFriendsFillData() {
        
        let friendsList: [Friends] = [
            Friends(nameFriend: "Charli", avatarName: "Ch_1", arrayAvatar: ["Ch_1", "Ch_2", "Ch_3", "Ch_4"]),
            Friends(nameFriend: "Leonardo", avatarName: "Di_1", arrayAvatar: ["Di_1", "Di_2", "Di_3", "Di_4"]),
            Friends(nameFriend: "Angelina", avatarName: "Dj_1", arrayAvatar: ["Dj_1", "Dj_2", "Dj_3", "Dj_4"]),
            Friends(nameFriend: "Chris", avatarName: "H_1", arrayAvatar: ["H_1", "H_2", "H_3", "H_4"]),
            Friends(nameFriend: "Jonhi", avatarName: "Jo_1", arrayAvatar: ["Jo_1", "Jo_2", "Jo_3", "Jo_4"]),
            Friends(nameFriend: "Keanu", avatarName: "Ki_1", arrayAvatar: ["Ki_1", "Ki_2", "Ki_3", "Ki_4"]),
            Friends(nameFriend: "Chris", avatarName: "Kr_1", arrayAvatar: ["Kr_1", "Kr_2", "Kr_3", "Kr_4"]),
            Friends(nameFriend: "Matthew", avatarName: "Mk_1", arrayAvatar: ["Mk_1", "Mk_2", "Mk_3", "Mk_4"]),
            Friends(nameFriend: "Megan", avatarName: "Me_1", arrayAvatar: ["Me_1", "Me_2", "Me_3", "Me_4"]),
            Friends(nameFriend: "Monika", avatarName: "Mo_1", arrayAvatar: ["Mo_1", "Mo_2", "Mo_3", "Mo_4"]),
            Friends(nameFriend: "Robert", avatarName: "Ro_1", arrayAvatar: ["Ro_1", "Ro_2", "Ro_3", "Ro_4"]),
            Friends(nameFriend: "Salma", avatarName: "Sa_2", arrayAvatar: ["Sa_1", "Sa_2", "Sa_3", "Sa_4"]),
            Friends(nameFriend: "Scarlett", avatarName: "Sc_1", arrayAvatar: ["Sc_1", "Sc_2", "Sc_3", "Sc_4"]),
            Friends(nameFriend: "Jason", avatarName: "St_1", arrayAvatar: ["St_1", "St_2", "St_3", "St_4"]),
            Friends(nameFriend: "Timothee", avatarName: "Ti_2", arrayAvatar: ["Ti_1", "Ti_2", "Ti_3", "Ti_4"]),
            Friends(nameFriend: "Zendaya", avatarName: "Ze_1", arrayAvatar: ["Ze_1", "Ze_2", "Ze_3", "Ze_4"])
        ]
        
        for i in friendsList {
            arrayFriendsList.append(i)
        }
        
    }
    
    
}
