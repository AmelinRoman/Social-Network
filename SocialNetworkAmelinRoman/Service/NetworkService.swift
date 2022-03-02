//
//  NetworkService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.02.2022.
//

import Foundation
import Alamofire

// - MARK: Класс для работы с VK API
final class NetworkService {
    
    let versionApi = "5.131"
    let token = UserSession.instance.token
    let configureSession = URLSessionConfiguration.default
    let session = URLSession.shared
    
    // - Функция для работы с WebView, авторизация VK
    func loadAuthorizeVK() -> URLRequest? {
        
        var urlComponens = URLComponents()
        
        urlComponens.scheme = "https"
        urlComponens.host = "oauth.vk.com"
        urlComponens.path = "/authorize"
        urlComponens.queryItems = [
            URLQueryItem(name: "client_id", value: "8080554"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: versionApi)
        ]
        guard let url = urlComponens.url else { return nil }
        
        let request = URLRequest(url: url)
        print(url)
        return request
    }
    
    // - Функция получения списка друзей с сервера VK и вывод результата наружу
    func loadUserFriends(complition: @escaping (Result<[FriendsItems], Error>) -> Void) {
        
        let sessionUrl = URLSession.shared
        // - Заспрос к API
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
            URLQueryItem(name: "access_token", value: UserSession.instance.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: versionApi),
            
        ]
        // - Ответ сервера
        guard let url = urlComponents.url else { return }
        let dataTask = sessionUrl.dataTask(with: url) { (data, response , error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                let data = data,
                error == nil
            else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
            do {
                // - Получение данных
                let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                print()
                //  передача данных
                complition(.success(friendsResponse.response.items))
            } catch {
                print(error)
                complition(.failure(error))
            }
            
        }
        dataTask.resume()
    }
// - Функция получения фотографий с VK API и вывод результата наружу
    func loadPhotoUsers(ownerID: String, complition: @escaping (Result<[Photo], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        // - Заспрос к API
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: UserSession.instance.token),
            URLQueryItem(name: "v", value: versionApi),
            URLQueryItem(name: "owner_id", value: ownerID),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        // - Ответ сервера
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print(json)
            var photo: [Photo] = []
            do {
                // - Получение данных
                let photoResponse = try JSONDecoder().decode(PhotoResponse.self, from: data)
                for i in 0...photoResponse.response.items.count - 1 {
                    if let photoUrl = photoResponse.response.items[i].sizes.last?.url {
                        photo.append(Photo.init(photo: photoUrl))
                    }
                }
                //  передача данных
                complition(.success(photo))
            }catch {
                complition(.failure(error))
                print(error)
            }
        })
        dataTask.resume()
    }
// - Функция получения списка групп с VK API и вывод результата наружу
    func loadUsersGroups(complition: @escaping (Result<[GroupsItems], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        // - Заспрос к API
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: UserSession.instance.token),
            URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: versionApi)
        ]
        // - Ответ сервера
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print(json)
            do {
                // - Получение данных
                let groupsResonse = try JSONDecoder().decode(GroupsResponse.self, from: data)
                print(groupsResonse)
                // - Передача данных
                complition(.success(groupsResonse.response.items))
            } catch {
                print(error)
                complition(.failure(error))
            }
        })
        dataTask.resume()
    }
// - Функция поиска в группах с VK API и вывод результата наружу
    func loadSearhGroupList(requestText: String, complition: @escaping (Result<[SearchGroupsItems], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        // - Заспрос к API
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: requestText),
            URLQueryItem(name: "sort", value: "0"),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: versionApi)
        ]
        // - Ответ сервера
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .fragmentsAllowed)
            print(json)
            do {
                // - Получение данных
                let searchGroupsResponse = try JSONDecoder().decode(SearchGroupsResponse.self, from: data)
                // - Передача данных
                complition(.success(searchGroupsResponse.response.items))
            } catch {
                complition(.failure(error))
            }
        })
        dataTask.resume()
    }
 
}

