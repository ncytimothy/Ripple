//
//  CheckInViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    enum Defaults {
        static let backgroundColors: [CGColor] = [UIColor.rgb(red: 247, green: 107, blue: 28).cgColor, UIColor.rgb(red: 250, green: 217, blue: 97).cgColor]
        static let organgeColor: UIColor = UIColor.rgb(red: 245, green: 166, blue: 35)
    }
    
    let topTitleContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.blue
        return containerView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\nHow are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        label.attributedText = attributedText
        
        return label
        
    }()
    

    var currentColorSet: Int!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = self.view.bounds
//    }
    



}



