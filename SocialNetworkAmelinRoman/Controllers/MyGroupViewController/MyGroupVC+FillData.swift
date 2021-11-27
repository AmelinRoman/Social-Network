//
//  MyGroupVC+FillData.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
 // - MARK: Расширение для работы c данными групп пользователя
extension MyGroupViewController {
     // - Функция добавления групп
    @objc func addGroup(_ notification: Notification) {
        
        guard let addObject = notification.object as? Group else {return}
        
        if arrayGroup.contains(where: { sourceGroup in
            sourceGroup.nameGroup == addObject.nameGroup
        }) {
            let alertController = UIAlertController(title: "Error", message: "Such a group already exists", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okey", style: .cancel)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        else {
            arrayGroup.append(addObject)
            tableView.reloadData()
        }
        
    }
}
