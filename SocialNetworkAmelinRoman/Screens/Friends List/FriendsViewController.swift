//
//  FriendsViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: FriendsViewController
 final class FriendsViewController: UIViewController {
    
     @IBOutlet weak var searchBar: UISearchBar!
     @IBOutlet weak var tableView: UITableView!
     let friendsIdentifier = "friendsIdentifier" // - Индификатор экрана
     var  heightFriendCell: CGFloat = 50 // - Константа для высоты ячейки
     var searchFriendResult: [RealmFriends] = [] // - Массив для searchBar
     var friendsArrayRealm = [RealmFriends]() {
         didSet {
             DispatchQueue.main.async {
                 self.configureSearchBar()
             }
         }
     } // - массив для Realma
     var friendsRealm: Results<RealmFriends>? = try? RealmService.load(typeOf: RealmFriends.self) // - переменная для записи в Realm
     private let friendsService = FriendsService.instance
     private var friendsToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
     let networkService = NetworkService<FriendsItems>() // - переменная для работы с NetworkService
     let friendToGallerySegue = "friendToGallerySegue" // - Индфикатор segue
     // - MARK: userFriends - viewDidLoad
     override func viewDidLoad() {
         super.viewDidLoad()
         configureTableView()
         friendsService.getFriends()
             .then(on: .global(), friendsService.parsedData(data:))
             .then(friendsService.friendsRealmInOut(friends:))
             .done(on: .main) { result in
                 self.friendsArrayRealm = result
             }
             .catch { error in
                 print(error)
             }
     }
// - MARK: UserFriends - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        friendsToken = friendsRealm?.observe( { [weak self] friendsChanges in
            guard let self = self else {return}
            switch friendsChanges {
                
            case .initial(_):
                self.tableView.reloadData()
            case .update(
                _,
                deletions: let deletions,
                insertions: let insertions,
                modifications: let modifications):
                let indexDeletions = deletions.map { IndexPath(row: $0, section: 0)}
                let indexInsertions = insertions.map { IndexPath(row: $0, section: 0)}
                let indexModication = modifications.map { IndexPath(row: $0, section: 0)}
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: indexDeletions, with: .automatic)
                self.tableView.insertRows(at: indexInsertions, with: .automatic)
                self.tableView.reloadRows(at: indexModication, with: .automatic)
                self.tableView.endUpdates()
            case .error(let error):
                print(error)
            }
        })
    }
// - MARK: UserFriends - viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        friendsToken?.invalidate()
    }
// - MARK: realoadFriends - Realm
    fileprivate func reloadFriends() {
        friendsRealm = try? RealmService
            .load(typeOf: RealmFriends.self)
        tableView.reloadData()
    }

}
