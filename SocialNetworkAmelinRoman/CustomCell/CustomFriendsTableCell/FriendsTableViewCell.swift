//
//  TableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 30.11.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tealView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.image = nil
        nameLabel.text = nil
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(image: UIImage?, nameFriend: String ) {
        
        avatarImage.image = image
        nameLabel.text = nameFriend
        
    }
    
    func configureTealView() {
        tealView.layer.borderColor = UIColor.black.cgColor
        tealView.layer.cornerRadius = 23
        tealView.layer.shadowRadius = 35
        tealView.layer.shadowColor = UIColor.black.cgColor
        tealView.layer.shadowOpacity = 0.91
        tealView.layer.shadowOffset = CGSize(width: 40, height: 32)
        avatarImage.layer.cornerRadius = 23
        
        
        
    }
    @IBAction func pressImage(_ sender: Any) {
        
       // let imageFrame = avatarImage.transform
        UIView.animate(withDuration: 3) {[weak self] in
            guard let self = self else {return}
            self.tealView.transform = .init(scaleX: 0.6, y: 0.7)
            //self.avatarImage.transform = .init(scaleX: 0.75, y: 0.86)
        } completion: { isSuccess in
            if isSuccess {
                UIView.animate(withDuration: 3,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 0.2,
                               options: [],
                               animations: {[weak self] in
                    guard let self = self else {return}
                    self.tealView.transform = .init(scaleX: 1, y: 1)
                   // self.avatarImage.transform = .init(scaleX: 1, y: 1)
                })
            }
            
        }
    }
    
    func configure(friends: Friends) {
        if let imageName = friends.avatarName {
            
            avatarImage.image = UIImage(named: imageName)
            configureTealView()
            
        }
        nameLabel.text = friends.nameFriend
        
    }
    
}
