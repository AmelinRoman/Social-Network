//
//  AllGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: AllGroupViewController
class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let allGroupIdentifier = "allGroupIdentifier" // - Индификатор экрана
    let heightAllGroupCell: CGFloat = 40 // - Высота ячейки
    var networkService = NetworkService() // - переменная для работы с NetworkService
    var groupsSearhRealm: Results<RealmSearhGroups>? // - переменная для записи в Realm
    private var searhGroupRealmToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в реалме
    var arrayAllGroupList: [RealmSearhGroups] = [] // - Массив всех групп

// MARK: allGroup - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()

    }
// MARK: allGroup - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searhGroupRealmToken = groupsSearhRealm?.observe( { [weak self] searchChanges in
            guard let self = self else {return}
            switch searchChanges {
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
// MARK: allGroup - viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        searhGroupRealmToken?.invalidate()
    }
// MARK: deleteOldSearch - Realm
    func deleteOldSeacrh() {
        guard let searhGroupRealm = groupsSearhRealm else {return}
        do{
            try RealmService.delete(object: searhGroupRealm)
        } catch {
            print(error)
        }
        
    }
// MARK: realoadSeacrhGroup - Realm
    func reloadSearhGroup() {
        groupsSearhRealm = try? RealmService
            .load(typeOf: RealmSearhGroups.self)
        tableView.reloadData()
    }
    
}
