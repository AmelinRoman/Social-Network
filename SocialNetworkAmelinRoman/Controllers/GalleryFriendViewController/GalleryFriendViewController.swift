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
    var ownerPhotoID = Int()
    var photoSizes = [Photo]() {
        // - наблюдатель , при взаимодействии обновляет tableView  и подгружает данные
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }  
        }
    }
    // - Segue identifier для перехода на FriendFotoViewController
    let toPhotoSegue = "toPhotoSegue"
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // - Передача данных в переменную
        networkService.loadPhotoUsers(ownerID: String(ownerPhotoID)) { [weak self] result in
            switch result {
            case .success(let photoSizes):
                self?.photoSizes = photoSizes
            case .failure(let error):
                print(error)
            }
        }
        
    }

}
