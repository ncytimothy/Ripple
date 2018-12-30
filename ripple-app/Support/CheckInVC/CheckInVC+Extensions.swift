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
        
//        nextBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(nextTapped))
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        
        cancelButton.setTitleColor(.gray, for: .normal)

        setupCollectionView()
//        setupBottomConstraints()
        
        feelingsCollectionView.delegate = self
        feelingsCollectionView.dataSource = self
        feelingsCollectionView.register(FeelingCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
        
//        self.navigationItem.setRightBarButton(nextBarButtonItem, animated: true)
        
//        backButton.alpha = 0
//        nextBarButtonItem.isEnabled = false
                
//        let titleLabel: UILabel = {
//            let label = UILabel()
//            let attributedText = NSMutableAttributedString(string: "How are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white])
//            label.attributedText = attributedText
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
        
//        let headerLabel = UILabel.setHeaderLabel(title: "Check-in", subtitle: "How are you feeling today?")
        
//        let titleLabel: UILabel = {
//            let label = UILabel()
//            label.numberOfLines = 2
//
//            let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
//
//            attributedText.append(NSAttributedString(string: "\nHow are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
//
//            label.attributedText = attributedText
//
//            label.translatesAutoresizingMaskIntoConstraints = false
//
//            return label
//        }()
        
        let headerTextView: UITextView = {
            let textView = UITextView()
            
            textView.backgroundColor = .clear
            
            let attributedText = NSMutableAttributedString(string: "Tag a feeling", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
            
            attributedText.append(NSAttributedString(string: "\nTag a feeling to your message and experience", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
            
            textView.attributedText = attributedText
            
            textView.isEditable = false
            textView.isSelectable = false
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
        }()
        
        let topTitleTextView: UITextView = {
            let textView = UITextView()
            
            textView.backgroundColor = UIColor.primaryOrange
            
            let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.black])
            
            attributedText.append(NSAttributedString(string: "\nHow are you feeling now?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.black]))
            
            textView.attributedText = attributedText
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
            
            return textView
        }()
        
        let headerContainerView: UIView = {
            let containterView = UIView()
            containterView.translatesAutoresizingMaskIntoConstraints = false
            return containterView
        }()
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [cancelButton, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControlsStackView.distribution = .fillEqually
        
    

        
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        
//        view.addSubview(titleLabel)
        view.addSubview(feelingsCollectionView)
//        view.addSubview(nextButton)
        view.addSubview(headerTextView)
        view.addSubview(bottomControlsStackView)
//        headerContainerView.addSubview(headerLabel)
//        view.addSubview()
    
        
        
        NSLayoutConstraint.activate([

//            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            headerContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            headerContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            headerContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
//
//            headerLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 28),
//            headerLabel.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor),
            
            headerTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            headerTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
//            nextButton.topAnchor.constraint(equalTo: headerTextView.bottomAnchor),
//            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),

            feelingsCollectionView.topAnchor.constraint(equalTo: headerTextView.bottomAnchor),
            feelingsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingConstraintForFeelingsCollection),
            feelingsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingConstraintForFeelingsCollection),
            feelingsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
    
            ])
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

//    func setupBottomConstraints() {
//        let bottomControlsStackView = UIStackView(arrangedSubviews: [cancelButton, nextButton])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        bottomControlsStackView.distribution = .fillEqually
//
//        view.addSubview(bottomControlsStackView)
//
//        NSLayoutConstraint.activate([
//                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//            ])
//    }
//
    static func setButtonFor(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func updateSelectUI(cell: FeelingCell) {
        
        if cell.isSelected {
            if  cell.colorOverlay.alpha == 0.0 {
                animateSelectOverlay(cell)
                nextButton.alpha = 1.0
                nextButton.isEnabled = true
            } else {
                animateDeselectOverlay(cell)
                nextButton.alpha = 0.5
                nextButton.isEnabled = false
            }
        }
        
        if !cell.isSelected && cell.colorOverlay.alpha != 0.0 {
            animateDeselectOverlay(cell)
        }
        
    }
    
    fileprivate func animateSelectOverlay(_ cell: FeelingCell) {
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options:                     [.curveEaseIn, .curveEaseOut], animations: {
            cell.colorOverlay.alpha = 0.68
            cell.colorOverlay.bounds.size.height -= 20
            cell.colorOverlay.bounds.size.width -= 20
        }, completion: nil
        )
    }
    
    
    fileprivate func animateDeselectOverlay(_ cell: FeelingCell) {
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.curveEaseIn, .curveEaseOut], animations: {
            cell.colorOverlay.bounds.size.height += 20
            cell.colorOverlay.bounds.size.width += 20
            cell.colorOverlay.alpha = 0.0
        }, completion: nil
        )
    }
    
}
