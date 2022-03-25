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
        // - запрос и получение данных с сохранением в Realm
        networkService.loadSearhGroupList(requestText: searchText) { result in
            switch result {
            case .success(let searchResult):
                let searhGroup = searchResult.map { RealmSearhGroups(searchText: $0.name, searhGroups: $0) }
                DispatchQueue.main.async {
                    do{
                        self.deleteOldSeacrh()
                        try RealmService.save(items: searhGroup)
                        self.reloadSearhGroup()
                        guard let resultRealm = self.groupsSearhRealm else {return}
                        self.arrayAllGroupList = Array(resultRealm)
                    } catch {
                        print(error)
                    }
                }
               // self.arrayAllGroupList = searchResult
            case .failure(let error):
                print(error)
            }
        }
        self.tableView.reloadData()
    }
}
