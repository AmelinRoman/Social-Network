//
//  NetworkService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.02.2022.
//

import Foundation
import Alamofire

// - MARK: Класс для работы с VK API
final class NetworkService<ItemsType: Decodable> {
    
    enum reqest {
        case userFriends
        case userGroups
        case seacrhGroups
        case photo
        case news
    }
    
    private let versionApi = "5.131"
    private let token = UserSession.instance.token
    private let configureSession = URLSessionConfiguration.default
    lazy var session = URLSession.shared
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        return constructor
    }()
    
    
    func fetch(type: reqest, text: String? = "", id: Int? = 0, complition: @escaping (Result<[ItemsType], Error>) -> Void) {
        
        var constuctor = urlConstructor
        switch type {
        case .userFriends:
            constuctor.path = "/method/friends.get"
            constuctor.queryItems = [
                URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
                URLQueryItem(name: "access_token", value: UserSession.instance.token),
                URLQueryItem(name: "fields", value: "photo_50"),
                URLQueryItem(name: "v", value: versionApi),
                
            ]
        case .userGroups:
            constuctor.path = "/method/groups.get"
            constuctor.queryItems = [
                URLQueryItem(name: "access_token", value: UserSession.instance.token),
                URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "v", value: versionApi)
            ]
        case .seacrhGroups:
            constuctor.path = "/method/groups.search"
            constuctor.queryItems = [
                URLQueryItem(name: "q", value: text),
                URLQueryItem(name: "sort", value: "0"),
                URLQueryItem(name: "access_token", value: token),
                URLQueryItem(name: "v", value: versionApi)
            ]
        case .photo:
            guard let id = id else { return }
            constuctor.path = "/method/photos.get"
            constuctor.queryItems = [
                URLQueryItem(name: "access_token", value: UserSession.instance.token),
                URLQueryItem(name: "v", value: versionApi),
                URLQueryItem(name: "owner_id", value: String(id)),
                URLQueryItem(name: "album_id", value: "profile"),
                URLQueryItem(name: "photo_sizes", value: "0"),
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "rev", value: "1")
            ]
        case .news:
            constuctor.path = "/method/newsfeed.get"
            constuctor.queryItems = [
                URLQueryItem(name: "v", value: versionApi),
                URLQueryItem(name: "access_token", value: UserSession.instance.token),
                URLQueryItem(name: "filters", value: "post,photo"),
                URLQueryItem(name: "max_photos", value: "9"),
                URLQueryItem(name: "source_ids", value: "friends,groups,pages")
            ]
        }
        
        guard let url = constuctor.url else { return }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil
            else { return }
            do {
                let json = try JSONDecoder().decode(Response<ItemsType>.self, from: data)
                complition(.success(json.response.items))
            } catch {
                print(error)
                complition(.failure(error))
            }
        }
        dataTask.resume()
    }
}

