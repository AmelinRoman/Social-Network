//
//  Singleton.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 10.02.2022.
//

final class UserSession {
    
    var token: String = ""
    var userId: Int = 0
    
    static let instance = UserSession()
    
    private init() { }
}
