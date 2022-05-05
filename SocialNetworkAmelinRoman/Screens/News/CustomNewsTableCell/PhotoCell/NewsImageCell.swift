//
//  NewsImageCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.04.2022.
//

import UIKit
import Kingfisher

final class NewsImageCell: UICollectionViewCell {

    @IBOutlet weak var imageNews: UIImageView?
    @IBOutlet weak var videoImage: UIImageView!
    
    func configure(image: UIImage?, video: Bool) {
        self.videoImage.isHidden = video
        self.imageNews?.image = image
        self.imageNews?.contentMode = .scaleAspectFit
    }
}
