//
//  GalleryFriendViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit
import RealmSwift
// - MARK: GalleryFriendViewController
final class GalleryFriendViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let galleryFriendCollectionIdentifier = "galleryFriendCollectionIdentifier" // - идентификатор коллекции
    var photoGalleryRealm: Results<RealmPhoto>? = try? RealmService.load(typeOf: RealmPhoto.self)// - переменная для записи в Realm
    var ownerPhotoID: Int? // - ID пользователя
    //var realmService = RealmService()
    var photoSizesFriend = [PhotoSizes]() // - переменная для url
    private var galleryTokenRealm: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
    let toPhotoSegue = "toPhotoSegue" // - Segue identifier для перехода на FriendFotoViewController
    private let networkService = NetworkService<PhotoItems>() // - переменная для работы с NetworkService
 // - MARK: Gallery - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        networkReqest()
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
    
    func networkReqest() {
        guard let ownerPhotoID = ownerPhotoID else { return }
        
        networkService.fetch(type: .photo, id: ownerPhotoID) { [weak self] result in
            switch result {
            case .success(let photo):
                DispatchQueue.main.async {
                    let items = photo.map {RealmPhoto(ownerID: ownerPhotoID, photo: $0)}
                    do{
                        try RealmService.save(items: items)
                        self?.photoGalleryRealm = try RealmService
                            .load(typeOf: RealmPhoto.self)
                            .filter("id == %@", ownerPhotoID)
                        self?.collectionView.reloadData()
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
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
