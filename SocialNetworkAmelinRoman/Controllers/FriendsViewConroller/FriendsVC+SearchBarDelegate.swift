//
//  FriendsVC+SearchController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 01.12.2021.
//

import UIKit
// - MARK: Extension FriendsViewController - UISeacrhBarDelegate
extension FriendsViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
        
        searchBar.delegate = self
        
        self.searchFriendResult = self.friendsArrayRealm
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchFriendResult = []
        if searchText == "" {
            searchFriendResult = self.friendsArrayRealm
        }
        else {
            for i in friendsArrayRealm {
                let name = i.fullName
                if name.lowercased().contains(searchText.lowercased()) {
                    searchFriendResult.append(i)
                }
            }
        }
        self.tableView.reloadData()
    }
}
