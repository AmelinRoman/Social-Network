//
//  GalleryFriendCollectionViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit
// - MARK: Класс для работы с UICollectionViewCell для класса GalleryFriendViewController
class GalleryFriendCollectionViewCell: UICollectionViewCell {
    // - Элементы в ячейке
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var avatarFriend: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // - Обновление ячеек
        avatarFriend.image = nil
    }
    // - Настройки ячейки
    func configure(image: UIImage?) {
        
        avatarFriend.image = image
        customView.backgroundColor = UIColor.black
        customView.layer.cornerRadius = 8
        
    }

}
