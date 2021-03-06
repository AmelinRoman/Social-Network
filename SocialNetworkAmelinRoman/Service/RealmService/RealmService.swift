//
//  RealmService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.03.2022.
//

import RealmSwift

final class RealmService {
    
    
    static let deleteIfMigration = Realm.Configuration( deleteRealmIfMigrationNeeded: true)
    
    class func save<T:Object>(
        items: [T],
        configuration: Realm.Configuration = deleteIfMigration,
        update: Realm.UpdatePolicy = .modified) throws {
            
            let realm = try Realm(configuration: configuration)
            print(configuration.fileURL)
            try realm.write({
                realm.add(
                    items,
                    update: update)
            })
            
        }
    
    class func load<T: Object>(typeOf: T.Type) throws -> [T] {
           let realm = try Realm()
           return realm.objects(T.self).map { $0 }
       }
    
    class func load<T: Object>(type: T.Type) throws -> [T] {
        let realm = try Realm()
        return realm.objects(T.self).map { $0 }
    }

    
    class func load<T:Object>(typeOf: T.Type) throws -> Results<T> {
        let realm = try Realm()
        return realm.objects(T.self)
    }
    
    class func delete<T:Object>(object: T) throws {
          let realm = try Realm()
          try realm.write {
              realm.delete(object)
          }
      }
    
    class func delete<T:Object>(object: Results<T>) throws {
        let realm = try Realm()
        try realm.write({
            realm.delete(object)
        })
    }
    
    class func clear() throws {
        let realm = try Realm()
        try realm.write({
            realm.deleteAll()
        })
    }
}


