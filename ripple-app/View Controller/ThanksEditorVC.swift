//
//  ThanksEditorVC.swift
//  ripple-app
//
//  Created by Tim Ng on 12/23/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class ThanksEditorViewController: UIViewController, UIActivityItemSource {
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Share gratitute messages using the Ripple app."
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return "Share gratitute messages using the Ripple app."
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return "Ripple Message"
    }
    
    
    let thanksTextView: UITextView = {
        let textView = UITextView()
        textView.text = EditorDefaults.placeholderText
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = .gray
        textView.textAlignment = .left
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.layer.cornerRadius = 8.0

        return textView
    }()
    
    var shareBarButtonItem = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    
        configureTapGestureRecognizer()
    }
    
    @objc func shareTapped() {
        print("sharedTapped!")
        let sharingText = thanksTextView.text
    
        let activityController = UIActivityViewController(activityItems: [sharingText], applicationActivities: nil)
        
        self.navigationController?.present(activityController, animated: true, completion: nil)
        
    }
    
}
