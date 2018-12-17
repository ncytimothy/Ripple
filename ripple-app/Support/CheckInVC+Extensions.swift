//
//  CheckInVC+Extensions.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

// Views Setup
extension CheckInViewController {
    
    
    func setupViews() {
    
        view.backgroundColor = UIColor.primaryOrange
        
        leadingConstraintForFeelingsCollection = 20
        setupCollectionView()
        feelingsCollectionView.delegate = self
        feelingsCollectionView.dataSource = self
        feelingsCollectionView?.register(FeelingCell.self, forCellWithReuseIdentifier: cellId)
        
        nextButton = UIButton(type: .system)
        nextButton.isHidden = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            
            let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
            
            attributedText.append(NSAttributedString(string: "\nHow are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
            
            label.attributedText = attributedText
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let topTitleTextView: UITextView = {
            let textView = UITextView()
            
            textView.backgroundColor = UIColor.primaryOrange
            
            let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.black])
            
            attributedText.append(NSAttributedString(string: "\nHow are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.black]))
            
            textView.attributedText = attributedText
            

            
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
            
            return textView
        }()
        
        let topTitleContainerView: UIView = {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            return containerView
        }()
       
        
        
        view.addSubview(feelingsCollectionView)
        view.addSubview(nextButton)
        view.addSubview(topTitleContainerView)
        topTitleContainerView.addSubview(titleLabel)
        
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.titleView = topTitleTextView
//        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100)
        
        NSLayoutConstraint.activate([
            
//            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            topTitleContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, ),
//            topTitleContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            topTitleContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            topTitleContainerView.heightAnchor.constraint(equalToConstant: 100),
            
//            topTitleContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
            
  

            titleLabel.centerXAnchor.constraint(equalTo: topTitleContainerView.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: topTitleContainerView.safeAreaLayoutGuide.centerYAnchor),
            
            
            
            feelingsCollectionView.topAnchor.constraint(equalTo: topTitleContainerView.safeAreaLayoutGuide.bottomAnchor),
            feelingsCollectionView.leadingAnchor.constraint(equalTo: topTitleContainerView.safeAreaLayoutGuide.leadingAnchor, constant: leadingConstraintForFeelingsCollection),
            feelingsCollectionView.trailingAnchor.constraint(equalTo: topTitleContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -leadingConstraintForFeelingsCollection),
            feelingsCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9),

            
            nextButton.topAnchor.constraint(equalTo: feelingsCollectionView.bottomAnchor, constant: 8),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            
            ])
    
    }
    
//    func createGradientView() {
//        gradientView.colors
//        
//    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    
}
