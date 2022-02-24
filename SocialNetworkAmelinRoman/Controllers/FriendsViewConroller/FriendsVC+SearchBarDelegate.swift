//
//  FriendsVC+SearchController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 01.12.2021.
//

import UIKit



extension FriendsViewController: UISearchBarDelegate {
    
   func configureSearchBar() {
       
       searchBar.delegate = self
       
       self.searchFriendResult = self.friendsItem
       self.tableView.reloadData()
   }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchFriendResult = []
        
        if searchText == "" {
            searchFriendResult = friendsItem
        }
        else {
        for i in friendsItem {
            let name = i.lastName + " " + i.firstName
            if name.lowercased().contains(searchText.lowercased()) {
                
                searchFriendResult.append(i)
             }
          }
       }
        self.tableView.reloadData()
    }
}
