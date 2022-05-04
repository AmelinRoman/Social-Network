//
//  GalleryFriendVC+CollectionViewDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit

// - MARK:  Extension GalleryFriendViewController - UICollectionViewDelegate
extension GalleryFriendViewController: UICollectionViewDelegate {
    // - Проверка segue и передача данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toPhotoSegue,
           let friendPhoto = sender as? String,
           //let arrayFriendPhoto = sender as? [String],
           let destination = segue.destination as? FriendPhotoViewController {
            destination.namePhotoFriend = friendPhoto
            destination.arrayPhoto = photoGalleryRealm
        }
    }
   // - Обработка нажатия, передача данных и переход на следующий Controller
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friendPhoto = photoGalleryRealm?[indexPath.item].url
        performSegue(withIdentifier: toPhotoSegue, sender: friendPhoto)
    }
}
