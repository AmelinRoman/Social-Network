//
//  GalleryFriendCollectionViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit
import Kingfisher
// - MARK: Класс для работы с UICollectionViewCell для класса GalleryFriendViewController
final class GalleryFriendCollectionViewCell: UICollectionViewCell {
    // - Элементы в ячейке
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var avatarFriend: UIImageView!
    @IBOutlet weak var countLikeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var buttonState: Bool = false
    var countLike: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarFriend.image = nil
    }
    func configure(model: RealmPhoto) {
        guard let url = URL(string: model.url) else { return }
        let imageUrl = ImageResource(downloadURL: url)
        avatarFriend.kf.setImage(with: imageUrl)
        avatarFriend.layer.cornerRadius = 15
        customView.layer.backgroundColor = UIColor.black.cgColor
        customView.layer.cornerRadius = 20
    }
    
    func animateLikeLabel() {
        UIView.animate(withDuration: 1) {
            self.countLikeLabel.transform = .identity
        }
    }

    @IBAction func pressLikeButton(_ sender: Any) {
        
        if buttonState {
            UIView.transition(with: countLikeLabel, duration: 3, options: .transitionFlipFromTop) {[weak self] in
                guard let self = self else {return}
                self.countLike -= 1
                self.countLikeLabel.text = String(self.countLike)
                self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            animateLikeLabel()
          /*  countLike -= 1
            countLikeLabel.text = String(countLike)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)*/
        } else {
            UIView.transition(with: countLikeLabel, duration: 1, options: .transitionFlipFromTop) {[weak self] in
                guard let self = self else {return}
                self.countLike += 1
                self.countLikeLabel.text = String(self.countLike)
                self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            animateLikeLabel()
            /*
            countLike += 1
            countLikeLabel.text = String(countLike)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)*/
        }
        buttonState = !buttonState
    }
}
