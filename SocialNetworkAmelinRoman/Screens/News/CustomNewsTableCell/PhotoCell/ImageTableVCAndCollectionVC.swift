//
//  ImageTableVC + CollectionVC.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 28.04.2022.
//

import UIKit

class ImageTableVCAndCollectionVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var imageService: PhotoService?
    var currentNews: NewsItems? = nil {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private var photoURL: [String] {
        var attachmens = [String]()
        attachmens.removeAll()
        currentNews?.attachments?.forEach({ index in
            if index.photo != nil {
                guard let image = index.photo?.sizes?.last?.url else {return}
                attachmens.append(image)
            } else if index.video != nil {
                guard let image = index.video?.image.last?.url else {return}
                attachmens.append(image)
            } else { return }
        })
        return attachmens
    }
    var numberOfItems = CGFloat()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        collectionView.dataSource = self
        collectionView.delegate = self
        imageService = PhotoService.init(container: collectionView)
        numberOfItems = CGFloat(photoURL.count)
        configureLayout()
        collectionView.register(NewsImageCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: NewsImageCell = collectionView.dequeueReusableCell(for: indexPath)
        let isVideo = currentNews?.attachments?[indexPath.row].video
        let image = imageService?.photo(atIndexPath: indexPath, byURL: photoURL[indexPath.row])
        
        
        cell.configure(image: image, video: isVideo == nil)
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var aspect21: NSLayoutConstraint!
    @IBOutlet weak var aspect31: NSLayoutConstraint!
    @IBOutlet weak var aspect11: NSLayoutConstraint!
    @IBOutlet weak var aspect32: NSLayoutConstraint!
    
// MARK: Action
    func configureLayout() {
        guard var aspesctOne = aspect11,
              var aspectTwo = aspect21,
              var ascpectThree = aspect31,
              var aspectFour = aspect32
        else {return}
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        aspesctOne.isActive = false
        aspectTwo.isActive = false
        ascpectThree.isActive = false
        aspectFour.isActive = false
        
       
        

        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        switch numberOfItems {
        case 1:
            aspesctOne.isActive = true
            layout.itemSize = CGSize(width: width, height: width)
        case 2:
            aspectTwo.isActive = true
            layout.itemSize = CGSize(width: width / numberOfItems, height: width / numberOfItems)
        case 3:
            ascpectThree.isActive = true
            layout.itemSize = CGSize(width: width / numberOfItems, height: width / numberOfItems)
        case 4:
            aspesctOne.isActive = true
            layout.itemSize = CGSize(width: width / 2, height: width / 2)
        case 5, 6:
            aspectFour.isActive = true
            layout.itemSize = CGSize(width: width / 3, height: width / 3)
        case 7, 8, 9:
            aspesctOne.isActive = true
            layout.itemSize = CGSize(width: width / 3, height: width / 3)
        default:
            break
        }
        
        collectionView.collectionViewLayout = layout
        collectionView.reloadData()
    }
    
}
