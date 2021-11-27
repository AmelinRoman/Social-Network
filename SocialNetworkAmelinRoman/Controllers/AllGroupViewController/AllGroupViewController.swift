//
//  AllGroupViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с экраном всех групп
class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    // - Индификатор экрана
    let allGroupIdentifier = "allGroupIdentifier"
    // - Высота ячейки
    let heightAllGroupCell: CGFloat = 40
    // - Массив всех групп
    var arrayAllGroupList = [Group]()
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        allGroupFillData()

    }
    
}
