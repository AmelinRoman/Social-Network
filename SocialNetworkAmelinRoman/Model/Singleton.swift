//
//  Singleton.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 10.02.2022.
//

final class SomeSingleton {
    
    var token: String = ""
    var userId: Int = 0
    
    static let instance = SomeSingleton()
    
    private init() { }
}
