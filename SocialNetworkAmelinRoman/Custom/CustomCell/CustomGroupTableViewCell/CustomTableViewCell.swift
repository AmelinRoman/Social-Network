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
    @IBOutlet weak var tealView: UIView!
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
    
    func configure(model: GroupsItems) {
        tealView.layer.cornerRadius = 25
        tealView.backgroundColor = UIColor.systemBlue
        tealView.layer.shadowColor = UIColor.black.cgColor
        tealView.layer.shadowRadius = 33
        tealView.layer.shadowOpacity = 0.91
        customImageView.layer.cornerRadius = 25
        self.customLabel.text = model.name
        guard let url = URL(string: model.photo) else { return }
        self.customImageView.load(url: url)
    }
    
    func configure(model: SearchGroupsItems) {
        tealView.layer.cornerRadius = 20
        tealView.backgroundColor = UIColor.blue
        tealView.layer.shadowColor = UIColor.white.cgColor
        tealView.layer.shadowRadius = 23
        tealView.layer.shadowOpacity = 0.91
        customImageView.layer.cornerRadius = 20
        self.customLabel.text = model.name
        guard let url = URL(string: model.photo) else { return }
        self.customImageView.load(url: url)
    }
    
    
}
