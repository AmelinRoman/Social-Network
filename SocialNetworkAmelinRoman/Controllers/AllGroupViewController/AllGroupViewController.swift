//
//  AllGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с экраном всех групп
class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // - Индификатор экрана
    let allGroupIdentifier = "allGroupIdentifier"
    // - Высота ячейки
    let heightAllGroupCell: CGFloat = 40
    var networkService = NetworkService()
    // - Массив всех групп
    var arrayAllGroupList = [SearchGroupsItems]() 
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        allGroupFillData()
        configureSearchBar()

    }
    
}
