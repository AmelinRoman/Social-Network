//
//  NewsVC+TVDataSource.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.04.2022.
//

import UIKit

extension NewsViewController: UITableViewDataSource {
    
    func configureTableView() {
        tableView.sectionHeaderTopPadding = 0
        tableView.dataSource = self
        tableView.register(TopTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(ImageTableVCAndCollectionVC.self)
        tableView.register(BottomTableViewCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = newsList[indexPath.section]
        
        switch indexPath.row {
        case Identifier.top.rawValue:
            let cell: TopTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            guard let source = newsService.getSource(news.sourceID ?? 0) else {return cell}
            cell.configure(avatar: source.0,
                           name: source.1,
                           dateNews: Date(timeIntervalSince1970: news.date ?? 0)
                            .toString(dateFormat: .dateTime))
            return cell
        case Identifier.text.rawValue:
            let cell: TextTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(text: news.text ?? "")
            cell.isHidden = news.text == ""
            return cell
        case Identifier.image.rawValue:
            let cell: ImageTableVCAndCollectionVC = tableView.dequeueReusableCell(for: indexPath)
            cell.currentNews = news
            return cell
        case Identifier.bottom.rawValue:
            let cell: BottomTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(isLikes: false,
                           likesCounter: news.likes?.count ?? 0,
                           commentsCounter: news.comments?.count ?? 0,
                           repostCounter: news.reposts?.count ?? 0)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
