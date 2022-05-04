//
//  FetchDataOperation.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 03.05.2022.
//

import Foundation
import RealmSwift

final class FetchDataOperation: AsyncOperation {
    
    let networkService = NetworkService<GroupsItems>()
    var fetchedData: [GroupsItems]?
    
    override func main() {
        DispatchQueue.global().async {
            self.networkService.fetch(type: .userGroups) { [weak self] fetchResult in
                switch fetchResult {
                case .success(let data):
                    self?.fetchedData = data.compactMap { $0 }
                    self?.state = .finished
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
