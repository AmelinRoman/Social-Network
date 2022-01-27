//
//  FriendsViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Класс для работы с экраном отображения друзей пользователя
class FriendsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // - Индификатор экрана
    let friendsIdentifier = "friendsIdentifier"
    // - Константа для высоты ячейки
    var  heightFriendCell: CGFloat = 50
    // - Массив данных
    var arrayFriendsList = [Friends]()
    // - Массив для searchBar
    var searchFriendResult = [Friends]()
    
   // var friendLoader = FriendsLoaderService()
   // var headerName = [String]()
    // - Индфикатор segue
    let friendToGallerySegue = "friendToGallerySegue"
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        myFriendsFillData()
        configureSearchBar()
        //loadHeaderName()
        
        
    }



}
