//
//  BottomTableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import UIKit

final class BottomTableViewCell: UITableViewCell {

    @IBOutlet weak var likeButtom: UIButton!
    @IBOutlet weak var commentButtom: UIButton!
    @IBOutlet weak var repostButtom: UIButton!
    
    func configure(isLikes: Bool, likesCounter: Int, commentsCounter: Int, repostCounter: Int) {
        if isLikes {
            likeButtom.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButtom.setTitle("\(likesCounter)", for: .normal)
            likeButtom.tintColor = .systemIndigo
        } else {
            likeButtom.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButtom.setTitle("\(likesCounter)", for: .normal)
            likeButtom.tintColor = .darkGray
        }
        
        commentButtom.setTitle("\(commentsCounter)", for: .normal)
        repostButtom.setTitle("\(repostCounter)", for: .normal)
        
    }
}
