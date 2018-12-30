//
//  QuoteViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/24/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import CoreData

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
    
    // Dependency Data Controller Injection
    var dataController: DataController!
    
    // Fetched Results Controller, specified with an entity
    var fetchedResultsController: NSFetchedResultsController<Quote>!
    
    // Loading Indicator for Collection View
    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.whiteLarge
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("REFRESH", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.titleLabel?.textColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(refreshPressed), for: .touchUpInside)
        return button
    }()
    
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        setUpFetchedResultsController()
        downloadRandomQuotes()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpFetchedResultsController()
        print("fetchedQuotes: \(fetchedResultsController.fetchedObjects)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        fetchedResultsController = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.presentLoadingAlert()
    }
    
// -------------------------------------------------------------------------
    // MARK: - Fetched Results Controller Setup
    
    fileprivate func setUpFetchedResultsController() {
        // 1. Create Fetch Request
        let fetchRequest: NSFetchRequest<Quote> = Quote.fetchRequest()
        
        // 2. Configure the fetch request by adding a sort rule
        // fetchRequest.sortDescriptors property takes an array of sort descriptors
        // .sortDescriptors **MUST** be set on any NSFetchedResultsController instance
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // 3. Instantiate fetched results controller with fetch request
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: "quote")
        
        // 4. Set the fetched results controller delegate property to self
        fetchedResultsController.delegate = self
        
        // 5. Perform fetch to load data and start tracking
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("The fetch cannot be performed: \(error.localizedDescription)")
        }
        
        // 6. Remove the Fetched Results Controller when the view disappears
        // 7. Implement delegate confromance + methods for fetched results controller for UI updates (in an Extension)
    }
// -------------------------------------------------------------------------
    // MARK: - Actions
    
    @objc func refreshPressed() {
        
        deleteAllQuotes()
        downloadRandomQuotes()
        
    }
    
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Delete Quotes
    
    func deleteAllQuotes() {
        quoteCollectionView.isScrollEnabled = false
        loadingIndicator.startAnimating()
        
        if let quotesToDelete = fetchedResultsController.fetchedObjects {
            for quoteToDelete in quotesToDelete {
                dataController.viewContext.delete(quoteToDelete)
                do {
                    try dataController.viewContext.save()
                } catch {
                    debugPrint("Cannot delete quote!")
                }
            }
            quoteCollectionView.isScrollEnabled = true
        }
    }

//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Helper
    fileprivate func downloadRandomQuotes() {
        var downloadCount: Int = 0
        
        guard (fetchedResultsController.fetchedObjects?.isEmpty)! else { return }
        
        while downloadCount < CollectionViewConstants.cellsCount {
            addRandomQuote()
            downloadCount += 1
        }
    }
    
    
    fileprivate func downloadQuotes() {
        TheySaidSoClient.sharedInstance().downloadQuotes(dataController: dataController) { (success, error) in
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
        guard (fetchedResultsController.fetchedObjects?.isEmpty)! else { return }
        
        TheySaidSoClient.sharedInstance().downloadRandomQuote(dataController: dataController) { (success, error) in
            if success {
                debugPrint("Success!")
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

// -------------------------------------------------------------------------
// MARK: - NSFetchedResultsControllerDelegate
extension QuoteViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            loadingIndicator.stopAnimating()
            quoteCollectionView.insertItems(at: [newIndexPath!])
        case .delete:
            quoteCollectionView.deleteItems(at: [indexPath!])
        case .update:
            quoteCollectionView.reloadItems(at: [newIndexPath!])
            break
        default:
            break
        }
    }
}
