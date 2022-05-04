//
//  MyGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: UserGroupViewController
final class UserGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let myGroupIdentifier = "myGroupIdentifier" // - Индификатор экрана
    let heightMyGroupCell: CGFloat = 50 // - Константа для высоты ячейки
    private var userGroupToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в Realm
    private let groupsService = GroupService.instance
    var userGroups = [RealmGroups]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
// - MARK: MyGroup - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        groupsService.getGroups { items in
            self.userGroups = items
        }
    }

    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    

}
