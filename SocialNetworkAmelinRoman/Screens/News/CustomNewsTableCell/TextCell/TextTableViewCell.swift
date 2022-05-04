//
//  TextTableViewCell.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import UIKit

final class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textLabelNews: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(text: String) {
        self.textLabelNews?.text = text
    }
    
}
