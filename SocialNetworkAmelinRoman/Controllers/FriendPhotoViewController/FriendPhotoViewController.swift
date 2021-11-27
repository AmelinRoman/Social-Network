//
//  FriendPhotoViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 27.11.2021.
//

import UIKit
// - MARK: Класс вывода фотографии на отдельный экран
class FriendPhotoViewController: UIViewController {


    @IBOutlet weak var photoFriend: UIImageView!
    
    
    var namePhotoFriend: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFillData()

        // Do any additional setup after loading the view.
    }
    

}
