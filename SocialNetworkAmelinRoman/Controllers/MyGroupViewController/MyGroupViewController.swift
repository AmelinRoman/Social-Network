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
    let heightMyGroupCell: CGFloat = 40
    // - Массив данных
    var arrayGroup = [Group]()
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
       // myGroupList()
        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(_:)), name: NSNotification.Name("addSelectedGroupNotification"), object: nil)
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    

}
