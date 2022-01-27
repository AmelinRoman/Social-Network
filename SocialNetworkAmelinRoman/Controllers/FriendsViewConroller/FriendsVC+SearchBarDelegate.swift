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
       searchFriendResult = arrayFriendsList
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchFriendResult = []
        
        if searchText == "" {
            searchFriendResult = arrayFriendsList
        }
        else {
        for i in arrayFriendsList {
            
            if i.nameFriend.lowercased().contains(searchText.lowercased()) {
                
                searchFriendResult.append(i)
             }
          }
       }
        self.tableView.reloadData()
    }
}
