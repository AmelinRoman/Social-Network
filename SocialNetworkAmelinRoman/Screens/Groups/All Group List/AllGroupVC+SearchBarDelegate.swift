//
//  AllGroupVC+SearchBarDelegate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.02.2022.
//

import UIKit

// MARK: AllGroupViewController - UISeacrhBarDelegate
extension AllGroupViewController: UISearchBarDelegate {
    
   func configureSearchBar() {
       searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            print(searchText)
        })
        arrayAllGroupList.removeAll()
        // - запрос и получение данных с сохранением в Realm
        
        networkService.fetch(type: .seacrhGroups, text: searchText) { [weak self] result in
            switch result {
            case .success(let searhResult):
                searhResult.forEach { i in
                    self?.arrayAllGroupList.append(RealmGroups(groups: i))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
