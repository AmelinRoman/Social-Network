//
//  MyGroupVC+TableViewDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
    // - MARK: Расширение для работы с UITableViewDelegate
extension MyGroupViewController: UITableViewDelegate {
   // - Функция высоты ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightMyGroupCell
        
    }
    
    // - Функция удаления групп
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         
         if editingStyle == .delete {
             
             let alertControl = UIAlertController(title: "Delete group", message: "Are you sure you want to delete this group?", preferredStyle: .actionSheet)
             let alertAction = UIAlertAction(title: "Yes", style: .default)
             
             { [weak self] _ in
                 guard let self = self else {return}
                 self.arrayGroup.remove(at: indexPath.row)
                 tableView.deleteRows(at: [indexPath], with: .fade)
             }
             alertControl.addAction(alertAction)
             self.present(alertControl, animated: true, completion: nil)

         }
    }
}
