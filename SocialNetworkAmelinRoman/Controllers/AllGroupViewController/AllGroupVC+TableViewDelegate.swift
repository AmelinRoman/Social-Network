//
//  AllGroupVC+TableViewDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// MARK: Extension AllGroupViewController - UITableViewDelegate
extension AllGroupViewController: UITableViewDelegate {
    // - Фунция высоты ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightAllGroupCell
    }
    // - Добавление групп при нажатии
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        NotificationCenter.default.post(name: NSNotification.Name("addSelectedGroupNotification"), object: arrayAllGroupList[indexPath.row])
//    }
}
