//
//  GalleryFriendViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit
import RealmSwift
// - MARK: GalleryFriendViewController
class GalleryFriendViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let galleryFriendCollectionIdentifier = "galleryFriendCollectionIdentifier" // - идентификатор коллекции
    var photoGalleryRealm: Results<RealmPhoto>? // - переменная для записи в Realm
    var ownerPhotoID: Int? // - ID пользователя
    //var realmService = RealmService()
    var photoSizesFriend = [Photo]() // - переменная для url
    private var galleryTokenRealm: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
    let toPhotoSegue = "toPhotoSegue" // - Segue identifier для перехода на FriendFotoViewController
    var networkService = NetworkService() // - переменная для работы с NetworkService
 // - MARK: Gallery - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        guard let ownerPhotoID = ownerPhotoID else {return}
        // - запрос и получение данных с сохранением в Realm
        networkService.loadPhotoUsers(ownerID: String(ownerPhotoID)) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let photoSizes):
                let galleryPhoto = photoSizes.map {RealmPhoto(ownerID: ownerPhotoID,
                                                              photo: $0)}
                DispatchQueue.main.async {
                    do{
                        self.deleteOldGallery()
                        try RealmService.save(items: galleryPhoto)
                        self.reloadGalleryPhoto()
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
// - MARK: Gallery - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        galleryTokenRealm = photoGalleryRealm?.observe( { [weak self] galleryChanges in
            guard let self = self else {return}
            switch galleryChanges {
            case .initial, .update:
                self.collectionView.reloadData()
            case .error(let error):
                print(error)
            }
        })
    }
// - MARK: Gallery - viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        galleryTokenRealm?.invalidate()
    }
// - MARK: deleteOldGallery - Realm
    fileprivate func deleteOldGallery() {
        guard let photoGalleryRealm = photoGalleryRealm else {return}
        do{
            try RealmService.delete(object: photoGalleryRealm)
        } catch {
            print(error)
        }

    }
// - MARK: realoadGalleryPhoto - Realm
    fileprivate func reloadGalleryPhoto() {
        photoGalleryRealm = try? RealmService
            .load(typeOf: RealmPhoto.self)
        collectionView.reloadData()
    }
}
