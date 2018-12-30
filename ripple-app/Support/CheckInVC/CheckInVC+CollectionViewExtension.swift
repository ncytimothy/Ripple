//
//  CheckInVC+CollectionViewExtension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/2/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension CheckInViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 3.0
        
        let constraintMultiplier: CGFloat = 2
        let numOfCells: CGFloat = 2
        let numOfSpaces: CGFloat = numOfCells - 1
      
        
        let dimension = (view.frame.width - (numOfSpaces * space) - (constraintMultiplier * leadingConstraintForFeelingsCollection)) / numOfCells
        
        layout.minimumInteritemSpacing = space
        layout.minimumLineSpacing = space
        layout.itemSize = CGSize(width: dimension, height: dimension)
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    
        feelingsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        feelingsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        feelingsCollectionView.backgroundColor = UIColor.primaryOrange
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("fetchedResultsController.sections?[section].numberOfObjects: \(fetchedResultsController.sections?[section].numberOfObjects)")
        return fetchedResultsController.sections?[section].numberOfObjects ?? CollectionViewConstants.cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feelingCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeelingCell
        feelingCell.feeling = self.fetchedResultsController.object(at: indexPath)
        
        return feelingCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FeelingCell
        
        guard let feelingText = cell.feeling?.feelingString else  { return }
//        let currentText = textToSend
//        textToSend = currentText
        updateSelectUI(cell: cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FeelingCell
        updateSelectUI(cell: cell)
    }
    
  

//    func updateSelectUI(cell: FeelingCell) {
//        
//        if cell.isSelected {
//            if  cell.colorOverlay.alpha == 0.0 {
//                animateSelectOverlay(cell)
//                nextButton.isHidden = false
//            } else {
//                animateDeselectOverlay(cell)
//                nextButton.isHidden = true
//            }
//        }
//        
//        if !cell.isSelected && cell.colorOverlay.alpha != 0.0 {
//            animateDeselectOverlay(cell)
//        }
//        
//    }
    
//    fileprivate func animateSelectOverlay(_ cell: FeelingCell) {
//        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options:                     [.curveEaseIn, .curveEaseOut], animations: {
//            cell.colorOverlay.alpha = 0.68
//            cell.colorOverlay.bounds.size.height -= 20
//            cell.colorOverlay.bounds.size.width -= 20
//        }, completion: nil
//        )
//    }
//    
//    
//    fileprivate func animateDeselectOverlay(_ cell: FeelingCell) {
//        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.curveEaseIn, .curveEaseOut], animations: {
//            cell.colorOverlay.bounds.size.height += 20
//            cell.colorOverlay.bounds.size.width += 20
//            cell.colorOverlay.alpha = 0.0
//        }, completion: nil
//        )
//    }
    
}
