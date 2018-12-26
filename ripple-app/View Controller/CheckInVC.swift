//
//  CheckInViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import CoreData

class CheckInViewController: UIViewController {
    
//--------------------------------------------------------------------------------------------------
    // MARK: Properties

    let cellId = "feelingCell"
    
    var feelingsCollectionView: UICollectionView!
    var leadingConstraintForFeelingsCollection: CGFloat = 20
    
    var nextBarButtonItem = UIBarButtonItem()
    
    var feelings = [Feeling]()
    
    // DataController property passed from AppeDelegate
    var dataController: DataController?
    
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
    
    @objc func nextTapped() {
        print("Next tapped...")

        let customTabBarController = CustomTabBarController()
        guard let tabBarViewControllers = customTabBarController.viewControllers else { return }
        
        let quoteVC = tabBarViewControllers[TabBarControllerConstants.QuoteViewController] as! QuoteViewController
        quoteVC.dataController = dataController
        
        self.navigationController?.pushViewController(customTabBarController, animated: true)
        
    }


}



