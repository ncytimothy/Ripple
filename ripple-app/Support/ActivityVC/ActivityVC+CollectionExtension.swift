//
//  ActivityVC+CollectionExtension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/30/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension ActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        activityCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        activityCollectionView.translatesAutoresizingMaskIntoConstraints = false
        activityCollectionView.backgroundColor = .primaryOrange
    

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: activityCellId, for: indexPath) as! ActivityCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 300)
    }
    
}
