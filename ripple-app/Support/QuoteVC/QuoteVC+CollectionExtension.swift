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
            quoteCollectionView.addSubview(loadingIndicator)
            
            NSLayoutConstraint.activate([
                    loadingIndicator.centerXAnchor.constraint(equalTo: quoteCollectionView.centerXAnchor),
                    loadingIndicator.centerYAnchor.constraint(equalTo: quoteCollectionView.centerYAnchor)
                ])
            
//            quoteCollectionView.isScrollEnabled = false
            
            
            
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? CollectionViewConstants.cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: quoteCellId, for: indexPath) as! QuoteCell
        
        //GUARD TO BE USED AND NEEDED
        // This is guard away the unneccesary redownloading of photos when the
        // persistent store already exists
        guard !(self.fetchedResultsController.fetchedObjects?.isEmpty)! else { return cell }
        cell.quote = self.fetchedResultsController.object(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // TODO: Perhaps dynamic sizing
       let longText = fetchedResultsController.object(at: indexPath).quoteString
        let rect = NSString(string: longText ?? "Long Quote").boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], context: nil)
        
        return CGSize(width: view.frame.width - 20, height: rect.height + 130)
    }
    
}
