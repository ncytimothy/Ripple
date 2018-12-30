//
//  ActivityViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/26/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    let activityCellId = "activityCell"
    var activityCollectionView: UICollectionView!
    
//-------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}
