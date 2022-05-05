//
//  AllGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
import RealmSwift
// - MARK: AllGroupViewController
final class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let allGroupIdentifier = "allGroupIdentifier" // - Индификатор экрана
    let heightAllGroupCell: CGFloat = 40 // - Высота ячейки
    let networkService = NetworkService<GroupsItems>() // - переменная для работы с NetworkService
    private var searhGroupRealmToken: NotificationToken? // - переменная notificatioToken для наблюдений измений в реалме
    var arrayAllGroupList = [RealmGroups]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

// MARK: allGroup - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()

    }
}
