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
    
    let testUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = String(UserDefaults.standard.integer(forKey: "testNum"))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerTextView: UITextView = {
        let textView = UITextView()
        
        textView.backgroundColor = .clear
        
        //            guard let usernameString = UserDefaults.standard.string(forKey: "username") else {
        //                print("cannot find key")
        //                return textView
        //            }
        
        print("\(UserDefaults.standard.string(forKey: "username"))")
        
//        guard let username = UserDefaults.standard.string(forKey: "username") else { return textView }
        
//        let attributedText = NSMutableAttributedString()
        
//        if let username = UserDefaults.standard.string(forKey: "username") {
//
//        }
//
//          attributedText.append(NSAttributedString(string: username, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
//        let attributedText = NSMutableAttributedString(string: "username", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
//
//        attributedText.append(NSAttributedString(string: "\nYou have given \(UserDefaults.standard.integer(forKey: "gratitude")) gratitudes so far", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
//
//        textView.attributedText = setTextViewAttributedText()
        
        textView.isEditable = false
        textView.isSelectable = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureTapGestureRecognizer()
        
        headerTextView.attributedText = setTextViewAttributedText()
        
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
    
    @objc func handleGratitude() {
        print("Trying to up gratitiude...")
        
        let curValue = UserDefaults.standard.integer(forKey: "gratitude")
        let newValue = curValue + 1
        print("newValue: \(newValue)")
        UserDefaults.standard.set(newValue, forKey: "testNum")
        UserDefaults.standard.set(newValue, forKey: "gratitude")
        let testNum = UserDefaults.standard.value(forKey: "testNum")
        print("\(testNum)")
        headerTextView.attributedText = setTextViewAttributedText()
        testUserLabel.text = String(UserDefaults.standard.value(forKey: "testNum") as! Int)
        
        
        
    }
    
    
    @objc func giveTapped() {
        print("Try to complete this gratitude...")
        
        let checkInVC = CheckInViewController()
        checkInVC.textToSend = editorTextView.text
        checkInVC.dataController = dataController
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
    
    @objc func textViewTapped() {
        print("textView tapped")
        
        let alert = UIAlertController(title: "Hello, what's your name?", message: "Enter your name to personalize your gifts!", preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            guard let name = alert.textFields?[0].text else { return }
            UserDefaults.standard.set(name, forKey: "username")
            print("UserDefaults.standard.string(forKey: \"username\"): \(UserDefaults.standard.string(forKey: "username"))")
            self.headerTextView.attributedText = self.setTextViewAttributedText()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)

        alert.addTextField()
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
//----------------------------------------------------------------------------------------------------------------------------------------

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
    

    
    func setValueToDefaults(key:String, value:AnyObject){
        self.removeKeyValueFromDefaults(Key:key)
        UserDefaults.standard.set(value, forKey: key)
        
    }
    
    func getValueFromDefaults(key:String) ->AnyObject?{
        
        if((UserDefaults.standard.value(forKey: key)) != nil){
            
            let value:AnyObject = UserDefaults.standard.value(forKey: key)! as AnyObject
            
            return value
        }else{
            
            return nil
        }
        
    }
    
    func removeKeyValueFromDefaults(Key:String){
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key)
        defaults.synchronize()
        
    }
    
    func setTextViewAttributedText() -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString()
        var usernameString = ""
        
        if let unwrappedUserTitle = UserDefaults.standard.string(forKey: "username") {
            usernameString = unwrappedUserTitle
        } else {
            usernameString = "Hi There"
        }
        
        print("usernameString: \(usernameString)")
        
         attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white]))
      
        
        let gratitudeCount = UserDefaults.standard.integer(forKey: "gratitude")
        
        if gratitudeCount == 1 {
                attributedText.append(NSAttributedString(string: "\nYou have given \(UserDefaults.standard.integer(forKey: "gratitude")) gratitude so far", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
            return attributedText
        }
        
        attributedText.append(NSAttributedString(string: "\nYou have given \(UserDefaults.standard.integer(forKey: "gratitude")) gratitudes so far", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        return attributedText
    }
    
}
