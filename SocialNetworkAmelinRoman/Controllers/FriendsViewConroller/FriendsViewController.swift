//
//  FriendsViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: FriendsViewController
class FriendsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let friendsIdentifier = "friendsIdentifier" // - Индификатор экрана
    var  heightFriendCell: CGFloat = 50 // - Константа для высоты ячейки
    var searchFriendResult: [RealmFriends] = []// - Массив для searchBar
    var friendsArrayRealm: [RealmFriends] = [] // - массив для Realma
    var friendsRealm: Results<RealmFriends>? // - переменная для записи в Realm
    private var friendsToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
    private var networkService = NetworkService() // - переменная для работы с NetworkService
    let friendToGallerySegue = "friendToGallerySegue" // - Индфикатор segue
// - MARK: userFriends - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // - запрос и получение данных с сохранением в Realm
        networkService.loadUserFriends { [weak self] result in
            switch result {
            case .success(let friendsItem):
                let friendResult = friendsItem.map { RealmFriends(friends: $0)}
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                        do {
                            try RealmService.save(items: friendResult)
                            self.reloadFriends()
                            guard let friends = self.friendsRealm else { return }
                            self.friendsArrayRealm = Array(friends)
                        } catch {
                            print(error)
                        }
                    }
            case .failure(let error):
                print(error)
            }
        }
        //loadHeaderName()
        
        
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
