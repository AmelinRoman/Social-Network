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
    
// - Функция получения списка друзей с сервера VK
    func loadUserFriends() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
   
        guard let host = urlComponents.url else { return }
        
        let params: Parameters = [
            "access_token": token,
            "v": versionApi
        ]
        
        AF.request(
        host,
        method: .get,
        parameters: params)
            .responseJSON(completionHandler: { response in
                guard let json = response.value else { return }
                print(json)
            })
        }
// - Функция получения фотографий с VK API
    func loadPhotoUsers() {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: versionApi),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        
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
        })
        dataTask.resume()
    }
// - Функция получения списка групп с VK API
    func loadUsersGroups() {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: versionApi)
        ]
        
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
        })
        dataTask.resume()
    }
// - Функция поиска в группах с VK API
    func loadSearhGroupList(request: String) {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: request),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: versionApi)
        ]
        
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
        })
        dataTask.resume()
    }
 
}
