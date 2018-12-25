//
//  QuoteViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/24/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    let quoteCellId = "quoteCell"
    var quoteCollectionView: UICollectionView!
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        downloadQuotes()
    }

//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Helper
    fileprivate func downloadQuotes() {
        TheySaidSoClient.sharedInstance().downloadQuotes { (success, error) in
            if success {
                debugPrint("Success!")
                self.quoteCollectionView.reloadData()
            }
        }
    }

    
    
    
}
