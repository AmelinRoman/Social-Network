//
//  AllGroupVC+SearchBarDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.02.2022.
//

import UIKit

extension AllGroupViewController: UISearchBarDelegate {
    
   func configureSearchBar() {
        
       searchBar.delegate = self
       
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        networkService.loadSearhGroupList(requestText: searchText) { result in
            switch result {
            case .success(let searchResult):
                self.arrayAllGroupList = searchResult
            case .failure(let error):
                print(error)
            }
        }

        self.tableView.reloadData()
    }
}
