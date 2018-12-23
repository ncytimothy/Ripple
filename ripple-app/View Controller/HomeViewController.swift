//
//  HomeViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIActivityItemSource {
    
    let homeCellId = "homeId"
    
    let editorTextView: UITextView = {
        let textView = UITextView()
        textView.text = EditorDefaults.placeholderText
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = .gray
        textView.textAlignment = .left
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.layer.cornerRadius = 8.0
        
        return textView
    }()
    
    let hintButton = HomeViewController.setButtonFor(title: "Hints")
    let giveThanksButton = HomeViewController.setButtonFor(title: "Give Thanks")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureTapGestureRecognizer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
    }
    
    // MARK: - Actions
    @objc func giveThanksTapped() {
        print("Give Thanks Tapped")
        let sharingText = editorTextView.text
        
        let activityController = UIActivityViewController(activityItems: [sharingText], applicationActivities: nil)
        
        self.navigationController?.present(activityController, animated: true, completion: nil)
        
    }
    
    @objc func hintTapped() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let hintVC = HintViewController(collectionViewLayout: layout)
        present(hintVC, animated: true, completion: nil)
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Share gratitute messages using the Ripple app."
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return "Share gratitute messages using the Ripple app."
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return "Ripple Message"
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if editorTextView.isFirstResponder {
            if let navigationBarOriginY = navigationController?.navigationBar.frame.maxY {
                // Add correct shifting distance for Add Quote Editor
                view.frame.origin.y = -editorTextView.frame.origin.y + navigationBarOriginY
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if let navigationBarOriginY = navigationController?.navigationBar.frame.maxY {
            // Add correct shifting distance for Add Quote Editor
            view.frame.origin.y = 0 + navigationBarOriginY
        }
    }
    
}
