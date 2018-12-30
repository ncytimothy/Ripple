//
//  HomeViewController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIActivityItemSource {
    
    enum EditorTextViewConstants {
        static let charUpperBound = 140
    }
    
    let homeCellId = "homeId"
    
    var dataController: DataController!
   
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
//    let giveThanksButton = HomeViewController.setButtonFor(title: "Give Thanks")
    let giveButton = HomeViewController.setButtonFor(title: "Give")
    
    let charCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = String(EditorTextViewConstants.charUpperBound)
        label.textColor = .white
        //            label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
  
    
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
//----------------------------------------------------------------------------------------------------------------------------------------
    // MARK: - Actions
//    @objc func giveThanksTapped() {
//        print("Give Thanks Tapped")
//        let sharingText = editorTextView.text
//
//        let activityController = UIActivityViewController(activityItems: [sharingText], applicationActivities: nil)
//
//        enableButton(button: giveButton)
//
//        activityController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
//            if completed == true {
//                print("completed!")
//                self.enableButton(button: self.giveButton)
//            } else {
//                self.disableButton(button: self.giveButton)
//            }
//        }
//
//        self.navigationController?.present(activityController, animated: true, completion: nil)
//
//    }
    
    
    @objc func hintTapped() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let hintVC = HintViewController(collectionViewLayout: layout)
        present(hintVC, animated: true, completion: nil)
    }
    
    
    @objc func giveTapped() {
        print("Try to complete this gratitude...")
        
        let checkInVC = CheckInViewController()
        checkInVC.textToSend = editorTextView.text
        show(checkInVC, sender: self)
        
        
//        UIView.animate(withDuration: 3,
//                       delay: 0, usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [.curveEaseIn,.curveEaseOut],
//                       animations: {
//                            self.editorTextView.alpha = 0.5
//                            self.editorTextView.alpha = 1
//                        },
//                       completion: nil)
//
//        replaceTextViewPlaceholder()
//        disableButton(button: giveButton)
        
        
    }
    
//----------------------------------------------------------------------------------------------------------------------------------------

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        
        return "Share gratitute messages using the Ripple app."
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        print("jen!")
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
//            if let navigationBarOriginY = navigationController?.navigationBar.frame.maxY {
                // Add correct shifting distance for Add Quote Editor
//                view.frame.origin.y = -editorTextView.frame.origin.y + navigationBarOriginY
//                view.frame.origin.y = -editorTextView.frame.origin.y + 50
//            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
        view.frame.origin.y = 0
        if let navigationBarOriginY = navigationController?.navigationBar.frame.maxY {
            // Add correct shifting distance for Add Quote Editor
//            view.frame.origin.y = 0 + navigationBarOriginY
            
        }
    }
    
}
