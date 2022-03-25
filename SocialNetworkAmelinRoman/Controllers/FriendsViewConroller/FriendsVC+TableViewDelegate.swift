//
//  FriendsVC+TableViewDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Extension FriendsViewController - UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    // - Функция высоты ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightFriendCell
    }
    // - Проверка segue и передача данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == friendToGallerySegue,
           let ownerID = sender as? Int,
           let destination = segue.destination as? GalleryFriendViewController {
            destination.ownerPhotoID = ownerID
        }
    }
     // - Обработка нажатия, передача данных и переход на следующий Controller 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let ownerID = friendsRealm?[indexPath.item].id {
            performSegue(withIdentifier: friendToGallerySegue, sender: ownerID)
        }
}


}
