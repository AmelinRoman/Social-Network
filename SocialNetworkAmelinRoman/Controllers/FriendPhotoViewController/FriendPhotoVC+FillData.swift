//
//  FriendPhotoVC+FillData.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 27.11.2021.
//

import UIKit



extension FriendPhotoViewController {
 
    func configureFillData() {
        photoFriend.image = UIImage(named: namePhotoFriend)
        viewPhoto.layer.backgroundColor = UIColor.black.cgColor
    }
    
}
