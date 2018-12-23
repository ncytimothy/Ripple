//
//  CheckInViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {

    let cellId = "feelingCell"
    
    var feelingsCollectionView: UICollectionView!
    var leadingConstraintForFeelingsCollection: CGFloat = 20
    

    var nextBarButtonItem = UIBarButtonItem()
    
    var feelings = [Feeling]()
    
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
        
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
//        let contactSelectionVC = ContactSelectionVC()
//        self.navigationController?.pushViewController(contactSelectionVC, animated: true)
        
    }



}



