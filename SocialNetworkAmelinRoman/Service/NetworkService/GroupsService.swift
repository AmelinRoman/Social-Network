//
//  GroupsService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 29.04.2022.
//

import Foundation
import RealmSwift

final class GroupService {
    
    static let instance = GroupService()
    private init() {}
    
    var groups = [RealmGroups]()
    
    func getGroups(complition: @escaping ([RealmGroups]) -> Void) {
        let fetchDataQueue: OperationQueue = {
            let queue = OperationQueue()
            queue.qualityOfService = .utility
            return queue
        }()
        
        let fetchData = FetchDataOperation()
        let realmSave = RealmSaveOperation()
        let realmLoad = RealmLoadOperation()
        
        realmSave.addDependency(fetchData)
        realmLoad.addDependency(realmSave)
        realmLoad.completionBlock = { complition(realmLoad.groups)}
        
        fetchDataQueue.addOperation(fetchData)
        fetchDataQueue.addOperation(realmSave)
        fetchDataQueue.addOperation(realmLoad)
    }
}
