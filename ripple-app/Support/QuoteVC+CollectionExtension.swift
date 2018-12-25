//
//  QuoteVC+CollectionExtension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/24/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension QuoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
        func setupCollectionView() {
            let layout = UICollectionViewFlowLayout()
    
            layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    
            quoteCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            quoteCollectionView.translatesAutoresizingMaskIntoConstraints = false
            quoteCollectionView.backgroundColor = .primaryOrange
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return QuoteSharedData.sharedInstance.Quotes.count ?? 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: quoteCellId, for: indexPath) as! QuoteCell
        cell.quote = QuoteSharedData.sharedInstance.Quotes[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // TODO: Perhaps dynamic sizing
       let longText = QuoteSharedData.sharedInstance.Quotes[indexPath.item].quoteString
        let rect = NSString(string: longText ?? "Long Quote").boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], context: nil)
        
        return CGSize(width: view.frame.width, height: rect.height + 110)
    }
    
}
