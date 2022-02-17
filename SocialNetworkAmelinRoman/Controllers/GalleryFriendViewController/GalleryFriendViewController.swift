//
//  GalleryFriendViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit
// - MARK: Класс для работы с фотогалереей друзей
class GalleryFriendViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let galleryFriendCollectionIdentifier = "galleryFriendCollectionIdentifier"
    // - Массив для хранения фото друзей
    var arrayGalleryFriend: [String] = []
    // - Segue identifier для перехода на FriendFotoViewController
    let toPhotoSegue = "toPhotoSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }

}
