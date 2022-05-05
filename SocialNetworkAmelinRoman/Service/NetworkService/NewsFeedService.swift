//
//  NewsFeedService.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 29.04.2022.
//

import UIKit
import RealmSwift

final class NewsFeedService {
    
    static let instance = NewsFeedService()
    private init() {}
    
    let networkService = NetworkService<NewsItems>()
    var newsFeed = [NewsItems]()
    
    func getNews(complition: @escaping () -> Void) {
        networkService { feeds in
            self.newsFeed = feeds
            self.newsFeed = self.newsFeed.filter({$0.attachments != nil})
            complition()
        }
    }
    
    func networkService(complition: @escaping ([NewsItems]) -> Void) {
        networkService.fetch(type: .news) { result in
            switch result {
            case .success(let newsFeed):
                let feed = newsFeed.map { news -> NewsItems in
                    return NewsItems(
                        sourceID: news.sourceID,
                        date: news.date,
                        text: news.text ?? "",
                        attachments: news.attachments,
                        likes: news.likes,
                        comments: news.comments,
                        reposts: news.reposts)
                }
                complition(feed)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadGroupByID(_ id: Int) -> GroupsItems? {
        do {
            let realmGroups: [RealmGroups] = try RealmService.load(typeOf: RealmGroups.self)
            guard let groups = realmGroups.filter({ $0.id == -id}).first else {return nil}
            return GroupsItems(id: groups.id, name: groups.name, photo: groups.photo)
        } catch {
            print(error)
            return nil
        }
    }
    
    func loadUserByID(_ id: Int) -> FriendsItems? {
        do {
            let friendsRealm: [RealmFriends] = try RealmService.load(typeOf: RealmFriends.self)
            guard let friends = friendsRealm.filter({ $0.id == id }).first else {return nil}
            return FriendsItems(id: friends.id, firstName: friends.firstName, lastName: friends.lastName, photo: friends.photo)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getSource(_ id: Int) -> (String, String)? {
        if id < 0 {
            guard let source = loadGroupByID(id) else {return nil}
            return (source.photo, source.name)
        } else {
            guard let source = loadUserByID(id) else {return nil}
            return (source.photo, source.firstName + source.lastName)
        }
    }
    
}
