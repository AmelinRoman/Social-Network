//
//  FriendsService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 29.04.2022.
//

import Foundation
import RealmSwift
import PromiseKit


final class FriendsService {
    
    static let instance = FriendsService()
    private init() {}
    
    enum AppError: Error {
        case errorTask, failedToDecode, realmInOutFail
    }
    
    lazy var mySession = URLSession.shared
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/friends.get"
        constructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
            URLQueryItem(name: "access_token", value: UserSession.instance.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return constructor
    }()
    
    func getFriends() -> Promise<Data> {
        return Promise { resolver in
            guard let url = urlConstructor.url else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            self.mySession.dataTask(with: request) { data, response, error in
                guard
                    let data = data,
                    error == nil
                else {
                    resolver.reject(AppError.errorTask)
                    return
                }
                resolver.fulfill(data)
            }.resume()
        }
    }
    
    func parsedData(data: Data) -> Promise<[FriendsItems]> {
        return Promise { resolver in
            do {
                let json = try JSONDecoder().decode(Response<FriendsItems>.self, from: data).response.items
                resolver.fulfill(json)
            } catch {
                resolver.reject(AppError.failedToDecode)
            }
        }
    }
    
    func friendsRealmInOut(friends: [FriendsItems]) -> Promise<[RealmFriends]> {
        return Promise { resolver in
            let items = friends.map { friendsCount in
                RealmFriends(friends: friendsCount)
            }
            DispatchQueue.main.async {
                do {
                    try RealmService.save(items: items)
                    let friendsResults = try RealmService.load(type: RealmFriends.self)
                    resolver.fulfill(friendsResults)
                } catch {
                    resolver.reject(AppError.realmInOutFail)
                    print(error)
                }
            }
        }
    }
}
