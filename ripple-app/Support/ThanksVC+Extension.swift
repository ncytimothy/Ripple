//
//  ThanksVC+Extension.swift
//  ripple-app
//
//  Created by Tim Ng on 12/23/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension ThanksEditorViewController: UITextViewDelegate {
    
    func setupViews() {
        view.backgroundColor = .primaryOrange
        
        shareBarButtonItem = UIBarButtonItem(title: "SHARE", style: .done, target: self, action: #selector(shareTapped))
        shareBarButtonItem.isEnabled = false
        
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Message"
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        navigationItem.setRightBarButton(shareBarButtonItem, animated: true)
        
        thanksTextView.delegate = self
        
        
        
        
        view.addSubview(thanksTextView)
        
        NSLayoutConstraint.activate([
                thanksTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                thanksTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                thanksTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                thanksTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),

            
            ])
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.text = ""
            textView.textColor = .black
            shareBarButtonItem.isEnabled = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if !textView.hasText || textView.text == EditorDefaults.placeholderText {
            replaceTextViewPlaceholder()
            shareBarButtonItem.isEnabled = false
        }
    }
    
    func replaceTextViewPlaceholder() {
        thanksTextView.text = EditorDefaults.placeholderText
        thanksTextView.textColor = .gray
        
    }
    
    func configureTapGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
