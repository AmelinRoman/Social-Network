//
//  AllGroupVC+TableViewDataSourse.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Расширение для работы с UITableViewDataSource
extension AllGroupViewController: UITableViewDataSource {
    // - Функция настроек tableView
    func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        // - Регистриуем Xib
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: allGroupIdentifier)
        
    }
   // - Функция кол-ва секций
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    // - Функция кол-ва ячеек равных кол-ву элементов в массиве
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        arrayAllGroupList.count
        
    }
    // - Функиця передачи данных в Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // - Вызываем Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: allGroupIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        // - Передаем данные
        cell.configure(group: arrayAllGroupList[indexPath.row])
        // - Возвращаем данные
        return cell
    }
    
    
    
}
