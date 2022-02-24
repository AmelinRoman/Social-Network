//
//  MyGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с экраном групп пользователя
class MyGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // - Индификатор экрана
    let myGroupIdentifier = "myGroupIdentifier"
    // - Константа для высоты ячейки
    let heightMyGroupCell: CGFloat = 50
    // - Массив данных
    var arrayGroup = [Group]()
    let networkService = NetworkService()
    var groupsItem = [GroupsItems]() {
        // - наблюдатель , при взаимодействии обновляет tableView  и подгружает данные
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // - Передача данных в переменную
        networkService.loadUsersGroups { [weak self] result in
            switch result {
            case .success(let groupsItem):
                self?.groupsItem = groupsItem
            case .failure(let error):
                print(error)
            }
        }
       // myGroupList()
        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(_:)), name: NSNotification.Name("addSelectedGroupNotification"), object: nil)
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    

}
