//
//  CheckInViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class CheckInViewController: UIViewController, MFMessageComposeViewControllerDelegate {
  
//--------------------------------------------------------------------------------------------------
    // MARK: Properties

    let cellId = "feelingCell"
    
    var textToSend: String = ""
    
    var feelingsCollectionView: UICollectionView!
    var leadingConstraintForFeelingsCollection: CGFloat = 20
    
    var nextBarButtonItem = UIBarButtonItem()
    
    var feelings = [FeelingNoCD]()
    
    // DataController property passed from AppeDelegate
    var dataController: DataController!
    
    // Fetched Results Controller
    var fetchedResultsController: NSFetchedResultsController<Feeling>!
    
    let nextButton: UIButton = CheckInViewController.setButtonFor(title: "SEND")
    let cancelButton: UIButton = CheckInViewController.setButtonFor(title: "CANCEL")
    
    enum FeelingConstants {
        struct ImageName {
            static let Happy = "happy"
            static let Sad = "sad"
            static let Love = "love"
            static let Worried = "worried"
            static let Angry = "angry"
            static let Joyful = "joyful"
        }
        
        struct FeelingString {
            static let Happy = "Happy"
            static let Sad = "Sad"
            static let Love = "Loved"
            static let Worried = "Worried"
            static let Angry = "Angry"
            static let Joyful = "Joyful"
        }
    }
    
    enum CollectionViewConstants {
        static let cellsCount: Int = 6
    }
    
    
    
//--------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    
//    fileprivate func setUpFeeings() {
//        let happy = setFeeling(imageName: FeelingConstants.ImageName.Happy, feelingString: FeelingConstants.FeelingString.Happy)
//        let sad = setFeeling(imageName: FeelingConstants.ImageName.Sad, feelingString: FeelingConstants.FeelingString.Sad)
//        let loved = setFeeling(imageName: FeelingConstants.ImageName.Love, feelingString: FeelingConstants.FeelingString.Love)
//        let worried = setFeeling(imageName: FeelingConstants.ImageName.Worried, feelingString: FeelingConstants.FeelingString.Worried)
//        let angry = setFeeling(imageName: FeelingConstants.ImageName.Angry, feelingString: FeelingConstants.FeelingString.Angry)
//        let joyful = setFeeling(imageName: FeelingConstants.ImageName.Joyful, feelingString: FeelingConstants.FeelingString.Joyful)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        setUpFetchedResultsController()
        
        print("(fetchedResultsController.fetchedObjects?.isEmpty)!: \((fetchedResultsController.fetchedObjects?.isEmpty)!)")
        
//        if !(fetchedResultsController.fetchedObjects?.isEmpty)! {
//            print("setting up feelings...")
//            setUpFeeings()
//        }
    }
    
// -------------------------------------------------------------------------
    // MARK: - Fetched Results Controller Setup
    
    fileprivate func setUpFetchedResultsController() {
        // 1. Create Fetch Request
        let fetchRequest: NSFetchRequest<Feeling> = Feeling.fetchRequest()
        
        // 2. Configure the fetch request by adding a sort rule
        // fetchRequest.sortDescriptors property takes an array of sort descriptors
        // .sortDescriptors **MUST** be set on any NSFetchedResultsController instance
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // 3. Instantiate fetched results controller with fetch request
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: "feeling")
        
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
    
//    fileprivate func setFeeling(imageName: String, feelingString: String) {
//        let feeling = Feeling(context: dataController.viewContext)
//        feeling.imageName = imageName
//        feeling.feelingString = feelingString
//        feeling.creationDate = Date()
//        do {
//            try dataController.viewContext.save()
//        } catch {
//            debugPrint("Cannot save feeling to Core Data")
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func handleNext() {
        print("Trying to get to next page...")
        
        // Test Code
        guard let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems else { return }
        
        for indexPath in indexPathForSelectItems {
            let selectedCell = feelingsCollectionView.cellForItem(at: indexPath) as! FeelingCell
            guard let feelingText = selectedCell.feeling?.feelingString else { return }
            
        }
        
        
        
        if let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems {
            print("indexPathForSelectItems: \(indexPathForSelectItems)")
            for indexPath in indexPathForSelectItems {
                let selectedCell = feelingsCollectionView.cellForItem(at: indexPath) as! FeelingCell
                guard let feelingText = selectedCell.feeling?.feelingString else { return }
                print("selectedCell.feeling?.feelingText: \(selectedCell.feeling?.feelingString)")
            }
        }
        
        if MFMessageComposeViewController.canSendText() {
            print("SMS services are available")
            
            if let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems {
                print("indexPathForSelectItems: \(indexPathForSelectItems)")
            }
            
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate = self
            
            guard let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems else { return }
            
            for indexPath in indexPathForSelectItems {
                let selectedCell = feelingsCollectionView.cellForItem(at: indexPath) as! FeelingCell
                guard let feelingText = selectedCell.feeling?.feelingString else { return }
                
                messageController.body = textToSend + " " + "#Feeling\(feelingText)"
                
                present(messageController, animated: true, completion: nil)
                
            }
            
        } else {
            print("SMS services are not available")
            let alert = UIAlertController(title: "SMS services not availlable", message: "SMS services are not availble on your device.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
//    @objc func nextTapped() {
//        print("Next tapped...")
//
////        let customTabBarController = CustomTabBarController()
////        guard let tabBarViewControllers = customTabBarController.viewControllers else { return }
////
////        let quoteVC = tabBarViewControllers[TabBarControllerConstants.QuoteViewController] as! QuoteViewController
////        quoteVC.dataController = dataController
////
////        self.navigationController?.pushViewController(customTabBarController, animated: true)
//
//    }
    
    @objc func handleCancel() {
        print("trying to cancel/dismiss check in vc...")
        dismiss(animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .sent:
            print("sent")
            dismiss(animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            })
            
        case .cancelled:
            print("cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("failed")
        }
        
        
    }


}

// -------------------------------------------------------------------------
// MARK: - NSFetchedResultsControllerDelegate
extension CheckInViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            feelingsCollectionView.insertItems(at: [newIndexPath!])
        case .delete:
            feelingsCollectionView.deleteItems(at: [indexPath!])
        case .update:
            feelingsCollectionView.reloadItems(at: [newIndexPath!])
            break
        default:
            break
        }
    }
}



