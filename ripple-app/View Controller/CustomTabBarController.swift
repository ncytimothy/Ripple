//
//  CustomTabBarController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/24/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.primaryOrange
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Give", image: UIImage(named: "heart-selected"), selectedImage: UIImage(named: "heart-selected"))
        
        let quoteVC = QuoteViewController()
        quoteVC.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(named: "quote"), selectedImage: UIImage(named: "quote"))
        let tabBarList = [homeVC, quoteVC]
        viewControllers = tabBarList
        
        
    }
    
    
}
