//
//  CheckInVC+Extensions.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension CheckInViewController: CAAnimationDelegate {
    
    func setupViews() {
        
//         createGradientLayer()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            
            let attributedText = NSMutableAttributedString(string: "Check-in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: Defaults.organgeColor])
            
            attributedText.append(NSAttributedString(string: "\nHow are you feeling today?", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.black]))
            
            label.attributedText = attributedText
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let topTitleContainerView: UIView = {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            return containerView
        }()
        
        view.addSubview(topTitleContainerView)
        topTitleContainerView.addSubview(titleLabel)
        
        topTitleContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topTitleContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topTitleContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topTitleContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: topTitleContainerView.leadingAnchor, constant: 28).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: topTitleContainerView.centerYAnchor).isActive = true
        
    }
    
//    func createGradientLayer() {
//        gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        gradientLayer.colors = Defaults.backgroundColors
//        gradientLayer.locations = [0, 0.5]
//        self.view.layer.addSublayer(gradientLayer)
//    }
//
    
    
}
