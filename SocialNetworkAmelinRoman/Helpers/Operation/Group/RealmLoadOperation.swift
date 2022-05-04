//
//  RealmLoadOperation.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 03.05.2022.
//

import Foundation
import RealmSwift

final class RealmLoadOperation: AsyncOperation {
    
    var groups = [RealmGroups]()
    
    override func main() {
        guard let realmData = dependencies.first as? RealmSaveOperation?,
              realmData?.fetchData != nil
        else {
            print("Error, can't check dependenciaes")
            return
        }
        DispatchQueue.main.async {
            do{
                self.groups = try RealmService.load(typeOf: RealmGroups.self)
                self.state = .finished
            } catch {
                print("Error. load groups from Realm function")
            }
        }
    }
}
