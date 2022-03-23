//
//  MyGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: UserGroupViewController
class UserGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let myGroupIdentifier = "myGroupIdentifier" // - Индификатор экрана
    let heightMyGroupCell: CGFloat = 50 // - Константа для высоты ячейки
    let networkService = NetworkService() // - переменная для работы с NetworkService
    var userGroupRealm: Results<RealmGroups>? // - переменная для записи в Realm
    private var userGroupToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
// - MARK: MyGroup - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // - запрос и получение данных с сохранением в Realm
        networkService.loadUsersGroups { [weak self] result in
            switch result {
            case .success(let groupsItem):
                let myGroupRealm = groupsItem.map { RealmGroups(groups: $0) }
                DispatchQueue.main.async {
                    do{
                        try RealmService.save(items: myGroupRealm)
                        self?.reloadMyGroups()
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
// - MARK: UserGroup - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userGroupToken = userGroupRealm?.observe( { [weak self] groupChanges in
            guard let self = self else {return}
            switch groupChanges {
                
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
// - MARK: UserGroup - viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userGroupToken?.invalidate()
    }
// - MARK: realoadMyGroup - Realm
    fileprivate func reloadMyGroups() {
        userGroupRealm = try? RealmService
            .load(typeOf: RealmGroups.self)
        tableView.reloadData()
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    

}
