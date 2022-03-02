//
//  FriendsVC+TableViewDataSource.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Расширение  для работы с UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    // - Функция настроек tableView
    func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        // - Регистрируем xib
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: friendsIdentifier)
        
    }
    // - Функция возвращение количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    // - Функция кол-ва ячеек равной кол-ву элементов в массиве
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchFriendResult.count
        
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let section = friendLoader.loaderFriend()[section]
        return String(section.key)
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return headerName
    }*/
    // - Передача данных в ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // - Вызываем Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsIdentifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        // - Передаем данные
        cell.configure(model: searchFriendResult[indexPath.row])
        // - Возвращаем данные
        return cell
    }
    
}

