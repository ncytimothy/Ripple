//
//  HintVC+Extension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/23/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension HintViewController {
    
    func setupViews() {
        collectionView.backgroundColor = .primaryOrange
        // .self: returns the class that we need
        // .self itself a closure () -> Self, referencing the class itself
        // .self is essentially return the type object, returning
        // the cell class itself
        
        collectionView.register(HintCell.self, forCellWithReuseIdentifier: hintCell)
        collectionView.isPagingEnabled = true
        
        
    }
    
    // Eliminate the spacing between the cells being scrolled
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // From UICollectionViewFlowLayout Protocol
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hintCell, for: indexPath) as! HintCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    
}
