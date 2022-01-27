//
//  CustomTableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с UITableViewCell для классов AllGroupViewController, MyGroupViewController, FriendsViewController
class CustomTableViewCell: UITableViewCell {
    // - Элементы в ячейке
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!
    // - Функция обновления ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
        customImageView.image = nil
        customLabel.text = nil
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    // - Передаем данные
    func configure(image: UIImage?, label: String) {
        
        customImageView.image = image
        customLabel.text = label
        
        
        
    }
    // - Фунция для работы со структурой Друзья
   /* func configure(friends: Friends) {
        
        if let imageName = friends.avatarName {
            customImageView.image = UIImage(named: imageName)
        }
        customLabel.text = friends.nameFriend
        
    }*/
    // - Фунция для работы со структурой Групп
    func configure(group: Group) {
        if let imageName = group.avatarGroupName {
            customImageView.image = UIImage(named: imageName)
        }
        customLabel.text = group.nameGroup
    }
    
    
}
