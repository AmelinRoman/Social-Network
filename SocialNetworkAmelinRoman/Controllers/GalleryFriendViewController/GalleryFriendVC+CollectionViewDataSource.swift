//
//  GalleryFriendVC+CollectionViewDataSource.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 26.11.2021.
//

import UIKit

// - MARK: Расширение для работы с CollectionView
extension GalleryFriendViewController: UICollectionViewDataSource {
    
    func configureCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GalleryFriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: galleryFriendCollectionIdentifier)
        collectionView.backgroundColor = UIColor.systemIndigo

    }
    // - Возвращаем кол-во секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    // - Возвращаем кол-во ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoSizes.count
    }
    // - Передаем данные в ячейку 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryFriendCollectionIdentifier, for: indexPath) as? GalleryFriendCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(model: photoSizes[indexPath.item])
        return cell
    }
    
}
