//
//  NewsViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import UIKit
import RealmSwift

final class NewsViewController: UIViewController {

    enum Identifier: Int {
        case top, text, image, bottom
    }
    
    @IBOutlet weak var tableView: UITableView!
    let newsService = NewsFeedService.instance
    var indexCell: Identifier?
    var newsList = [NewsItems](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            self.newsService.getNews {
                self.newsList = self.newsService.newsFeed
            }
        }
        configureTableView()
        
            
    }
}
