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
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    // Fixed Collection View Cells Count
    enum CollectionViewConstants {
        static let cellsCount: Int = 5
    }
    
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
//        downloadQuotes()
//        downloadRandomQuote()
        downloadRandomQuotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.presentLoadingAlert()
    }
    

//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Helper
    fileprivate func downloadRandomQuotes() {
        var downloadCount: Int = 0
        
        while downloadCount < CollectionViewConstants.cellsCount {
            addRandomQuote()
            downloadCount += 1
        }
    }
    
    
    fileprivate func downloadQuotes() {
        TheySaidSoClient.sharedInstance().downloadQuotes { (success, error) in
            if success {
                debugPrint("Success!")
                DispatchQueue.main.async {
                    self.quoteCollectionView.reloadData()
                }
                
                // TODO: Prevention from tampering of the collection so that cells can be returned
                // properly
                
//                print("QuoteSharedData.sharedInstance.Quotes.count: \(QuoteSharedData.sharedInstance.Quotes.count)")
//
//                if QuoteSharedData.sharedInstance.Quotes.count == CollectionViewConstants.cellsCount {
//                    self.quoteCollectionView.isScrollEnabled = true
//                    self.alert.dismiss(animated: true, completion: nil)
//                }
                
            }
        }
    }
    
    fileprivate func addRandomQuote() {
        TheySaidSoClient.sharedInstance().downloadRandomQuote { (success, error) in
            if success {
                debugPrint("Success!")
                DispatchQueue.main.async {
                    self.quoteCollectionView.reloadData()
                }
            }
        }
    }
}

//-------------------------------------------------------------------------------------------------------------------------------------
// MARK: - Extension for other helpers

private extension QuoteViewController {
    // MARK: - Loading Alert Configurations
    private func presentLoadingAlert() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
}
