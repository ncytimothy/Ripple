//
//  ContactsSelectionVC+Extension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts

extension ContactSelectionVC {
    func setupViews() {
        
         view.backgroundColor = .primaryOrange
        
        nextBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(nextTapped))
        
        setupCollectionView()
        safeCirclesCollectionView.delegate = self
        safeCirclesCollectionView.dataSource = self
        safeCirclesCollectionView.register(PersonCell.self, forCellWithReuseIdentifier: personCellId)
        
        self.navigationItem.setRightBarButton(nextBarButtonItem, animated: true)
        nextBarButtonItem.isEnabled = false
        

        let headerTextView: UITextView = {
            let textView = UITextView()
            
            textView.backgroundColor = .clear
            
            let attributedText = NSMutableAttributedString(string: "Safe Circle", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
            
            attributedText.append(NSAttributedString(string: "\nAdd the friends and family \nwho you can trust to be in your Safe Circle", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
            
            textView.attributedText = attributedText
            
            textView.isEditable = false
            textView.isSelectable = false
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
        }()
        
        let bottomButton: UIButton = {
            let button = UIButton()
            button.setTitle("Add Contact", for: .normal)
            button.setTitleColor(.primaryOrange, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        bottomButton.addTarget(self, action: #selector(showContactsPicker), for: .touchUpInside)

        view.addSubview(headerTextView)
        view.addSubview(bottomButton)
        view.addSubview(safeCirclesCollectionView)
    
        
        NSLayoutConstraint.activate([

            
            headerTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            headerTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            headerTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.26),
            
            safeCirclesCollectionView.topAnchor.constraint(equalTo: headerTextView.bottomAnchor),
            safeCirclesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            safeCirclesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            safeCirclesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bottomButton.topAnchor.constraint(equalTo: safeCirclesCollectionView.bottomAnchor, constant: 8),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.widthAnchor.constraint(equalToConstant: 200)
            
            ]) 
    }
    

    func updateSelectUI() {
        if SharedData.sharedInstance.people.count > 0 {
            nextBarButtonItem.isEnabled = true
        } else {
            nextBarButtonItem.isEnabled = false
        }
    }
    
    
}
