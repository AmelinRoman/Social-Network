//
//  CustomTableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import Kingfisher
// - MARK: Класс для работы с UITableViewCell для классов AllGroupViewController, MyGroupViewController, FriendsViewController
final class CustomTableViewCell: UITableViewCell {
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
    
    func configure(model: RealmGroups) {
        tealView.layer.cornerRadius = 25
        tealView.backgroundColor = UIColor.systemBlue
        tealView.layer.shadowColor = UIColor.black.cgColor
        tealView.layer.shadowRadius = 33
        tealView.layer.shadowOpacity = 0.91
        customImageView.layer.cornerRadius = 25
        self.customLabel.text = model.name
        guard let url = URL(string: model.photo) else {return}
        let imageUrl = ImageResource(downloadURL: url)
        self.customImageView.kf.setImage(with: imageUrl)
    }
}
