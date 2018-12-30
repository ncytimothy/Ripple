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
    
    var feelings = [Feeling]()
    
    // DataController property passed from AppeDelegate
    var dataController: DataController?
    
    
    let nextButton: UIButton = CheckInViewController.setButtonFor(title: "SEND")
    let cancelButton: UIButton = CheckInViewController.setButtonFor(title: "CANCEL")
    
    
//    let nextButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("SEND", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    

    
    enum TabBarControllerConstants {
        static let HomeViewController = 0
        static let QuoteViewController = 1
        static let ActivityViewController = 2
        static let HistoryViewController = 3
    }
    
//--------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        
        let happy = Feeling.setFeeling(feelingImageName: "happy", feelingText: "Happy")
        let sad = Feeling.setFeeling(feelingImageName: "sad", feelingText: "Sad")
        let loved = Feeling.setFeeling(feelingImageName: "love", feelingText: "Loved")
        let worried = Feeling.setFeeling(feelingImageName: "worried", feelingText: "Worried")
        let angry = Feeling.setFeeling(feelingImageName: "angry", feelingText: "Angry")
        let joyful = Feeling.setFeeling(feelingImageName: "joyful", feelingText: "Joyful")
        
        feelings.append(happy)
        feelings.append(sad)
        feelings.append(loved)
        feelings.append(worried)
        feelings.append(angry)
        feelings.append(joyful)
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func handleNext() {
        print("Trying to get to next page...")
        
        // Test Code
        guard let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems else { return }
        
        for indexPath in indexPathForSelectItems {
            let selectedCell = feelingsCollectionView.cellForItem(at: indexPath) as! FeelingCell
            guard let feelingText = selectedCell.feeling?.feelingText else { return }
            
        }
        
        
        
        if let indexPathForSelectItems = feelingsCollectionView.indexPathsForSelectedItems {
            print("indexPathForSelectItems: \(indexPathForSelectItems)")
            for indexPath in indexPathForSelectItems {
                let selectedCell = feelingsCollectionView.cellForItem(at: indexPath) as! FeelingCell
                guard let feelingText = selectedCell.feeling?.feelingText else { return }
                print("selectedCell.feeling?.feelingText: \(selectedCell.feeling?.feelingText)")
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
                guard let feelingText = selectedCell.feeling?.feelingText else { return }
                
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



