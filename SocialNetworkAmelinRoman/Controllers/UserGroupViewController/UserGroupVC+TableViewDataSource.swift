//
//  MyGroupVC+TableViewDataSourse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// MARK: Extension UserGroupViewController - UITableViewDataSource
extension UserGroupViewController: UITableViewDataSource {
    // - Функция настроек tableView
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // - Регистрируем xib
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: myGroupIdentifier)
    }
    // - Функция возвращение количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // - Функция кол-ва ячеек равной кол-ву элементов в массиве
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userGroupRealm?.count ?? 0
    }
    // - Передача данных в ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // - Вызываем Cell
        guard
            let myGroups = userGroupRealm?[indexPath.item],
            let cell = tableView.dequeueReusableCell(withIdentifier: myGroupIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        // - Передаем данные
        cell.configure(model: myGroups)
        //cell.configure(model: groupsItem[indexPath.row])
        //cell.configure(group: arrayGroup[indexPath.row])
        // - Возвращаем данные
        return cell
    }
}
