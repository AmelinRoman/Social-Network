//
//  RealmSaveOperation.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 03.05.2022.
//

import Foundation
import RealmSwift

 final class RealmSaveOperation: AsyncOperation {
    private(set) var fetchData: [RealmGroups] = []
    private(set) var realmResults: Results<RealmGroups>?
    
    override init() {}
    
    override func main() {
        guard let fetchDataOperation = dependencies.first(where: { $0 is
            FetchDataOperation }) as? FetchDataOperation,
              let data = fetchDataOperation.fetchedData
        else {
            print("Error. Data is not loaded from JSON")
            return
        }
        self.fetchData = data.map({ RealmGroups(groups: $0)})
        DispatchQueue.main.async {
            do {
                try RealmService.save(items: self.fetchData)
                self.state = .finished
            } catch {
                print("Erorr. Can't load groups from Realm at \(#function): ", error)
            }
        }
    }
}
