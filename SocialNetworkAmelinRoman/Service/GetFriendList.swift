//
//  GetFriendList.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 18.02.2022.
//

import Foundation

/*
"id":37827
"first_name":"Екатерина"
"last_name":"Политаева"
"can_access_closed":true
"is_closed":false
"photo_50":*/

/*struct FriendsResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Items]
        
        struct Items: Decodable {
            var id: Int
            var firstName: String
            var lastName: String
            var photo: String
        }
    }
}*/


/*final class GetFriendsList {
    
    
    func loadData(comlition: @escaping ([Friends]) -> Void) {
        
        
        let urlConfigure = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlConfigure)
        
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "vk.api.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(UserSession.instance.userId)),
            URLQueryItem(name: "access_token", value: UserSession.instance.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }
        let reqest = URLRequest(url: url)
        let task = urlSession.dataTask(with: reqest) { (data, response , error) in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            do {
                let arrayFriends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                var fullName: [Friends] = []
                for i in 0...arrayFriends.response.items.count - 1 {
                    let name = ((arrayFriends.response.items[i].firstName) + " " + (arrayFriends.response.items[i].lastName))
                    let avatar = arrayFriends.response.items[i].photo
                    let id = String(arrayFriends.response.items[i].id)
                    fullName.append(Friends.init(nameFriend: name, avatarName: avatar, userID: id))
                }
                comlition(fullName)
            } catch let error {
                print(error)
                comlition([])
            }
        }
        task.resume()
    }
}

*/
