//
//  TopTableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import UIKit
import Kingfisher

final class TopTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var dataLabel: UILabel?
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(avatar: String,name: String, dateNews: String) {
        self.avatarImageView?.image = UIImage(named: "socialNetwork")
        self.avatarImageView?.kf.setImage(with: URL(string: avatar), placeholder: UIImage(named: "socialNetwork"))
        self.nameLabel?.text = name
        self.dataLabel?.text = dateNews
    }
}
