//
//  ContactSelectionVC+CollectionViewExtension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension ContactSelectionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
      
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        safeCirclesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        safeCirclesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        safeCirclesCollectionView.backgroundColor = .white
        safeCirclesCollectionView.backgroundColor = .primaryOrange
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PersonSharedData.sharedInstance.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: personCellId, for: indexPath) as! PersonCell
        cell.person = PersonSharedData.sharedInstance.people[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    
    
}
