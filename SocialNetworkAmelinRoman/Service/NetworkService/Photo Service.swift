//
//  Photo Service.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 30.04.2022.
//

import Foundation
import UIKit
import Alamofire


final class PhotoService {
    
    private var images = [String: UIImage]()
    private let cacheLifeTime: TimeInterval = 30 * 24 * 60 * 60
    
    private let container: DataReloadable
    
    init(container: UITableView) {
        self.container = Table(table: container)
    }
    
    init(container: UICollectionView) {
        self.container = Collection(collection: container)
    }
    
    private static let pathName: String = {
        let pathName = "images"
        
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return pathName}
        let url = cachesDirectory.appendingPathComponent(pathName, isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: url.path) {
            try? FileManager.default.createDirectory(
                at: url,
                withIntermediateDirectories: true,
                attributes: nil)
        }
        return pathName
    }()
    
    func photo(atIndexPath indexPath: IndexPath, byURL url: String) -> UIImage? {
        var image: UIImage?
        if let photo = images[url] {
            image = photo
        } else if let photo = getImage(url: url) {
            image = photo
        } else {
            loadPhoto(atIndexPath: indexPath, byURL: url)
        }
        return image
    }
    
    private func getImage(url: String) -> UIImage? {
        guard let fileName = getFilePath(url: url),
              let info = try? FileManager.default.attributesOfItem(atPath: fileName),
              let modificationDate = info[FileAttributeKey.modificationDate] as? Date
        else { return nil }
        
        let lifeTime = Date().timeIntervalSince(modificationDate)
        
        guard lifeTime <= cacheLifeTime,
              let image  = UIImage(contentsOfFile: fileName)
        else {return nil}
        
        DispatchQueue.global().async {
            self.images[url] = image
        }
        return image
    }
    
    private func getFilePath(url: String) -> String? {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        let hashName = url.split(separator: "/").last ?? "default"
        return cachesDirectory.appendingPathComponent(PhotoService.pathName + "/" + hashName).path
    }
    
    private func loadPhoto(atIndexPath indexPath: IndexPath, byURL url: String) {
        AF.request(url).response(queue: .global()) { [weak self] response in
            guard let data = response.data,
                  let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.global().async {
                self?.images[url] = image
            }
            
            self?.saveImage(url: url, image: image)
            
            DispatchQueue.main.async {
                self?.container.reloadRow(atIndexPath: indexPath)
            }
        }
    }
    
    private func saveImage(url: String, image: UIImage) {
        guard let fileName = getFilePath(url: url),
              let data = image.pngData() else { return }
        
        FileManager.default.createFile(
            atPath: fileName,
            contents: data,
            attributes: nil)
    }
}

fileprivate protocol DataReloadable {
    func reloadRow(atIndexPath indexPath: IndexPath)
}

extension PhotoService {
    
    private class Table: DataReloadable {
        let table: UITableView
        
        init(table: UITableView) {
            self.table = table
        }
        
        func reloadRow(atIndexPath indexPath: IndexPath) {
            table.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    private class Collection: DataReloadable {
        let collection: UICollectionView
        
        init(collection: UICollectionView) {
            self.collection = collection
        }
        
        func reloadRow(atIndexPath indexPath: IndexPath) {
            collection.reloadItems(at: [indexPath])
        }
    }
}
