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
    var searchFriendResult = [FriendsItems]()
    
    private var networkService = NetworkService()
    var friendsItem = [FriendsItems]() {
        // - наблюдатель , при взаимодействии обновляет tableView  и подгружает данные
        didSet {
            DispatchQueue.main.async {
                self.configureSearchBar()
            }
        }
    }
    
   // var friendLoader = FriendsLoaderService()
   // var headerName = [String]()
    // - Индфикатор segue
    let friendToGallerySegue = "friendToGallerySegue"
    // - Инициализация объектов и вывод на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // - Передача данных в переменную
        networkService.loadUserFriends { [weak self] result in
            switch result {
            case .success(let friendsItem):
                self?.friendsItem = friendsItem
            case .failure(let error):
                print(error)
            }
        }
        //loadHeaderName()
        
        
    }



}
