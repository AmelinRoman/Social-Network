//
//  FriendsViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с экраном отображения друзей пользователя
class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    // - Индификатор экрана
    let friendsIdentifier = "friendsIdentifier"
    // - Константа для высоты ячейки
    let heightFriendCell: CGFloat = 40
    // - Массив данных
    var arrayFriendsList = [Friends]()
    
    let friendToGallerySegue = "friendToGallerySegue"
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        myFriendsFillData()
    }


}
