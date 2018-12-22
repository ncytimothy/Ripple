//
//  ContactSelectionVC.swift
//  ripple-app
//
//  Created by Tim Ng on 12/16/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContactSelectionVC: UIViewController, CNContactPickerDelegate {

    let personCellId = "personId"
    let contactsPicker = CNContactPickerViewController()
    var safeCirclesCollectionView: UICollectionView!
    
    var nextBarButtonItem = UIBarButtonItem()
    
    var person = Person()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryOrange
    
        contactsPicker.delegate = self
        setupViews()
        updateSelectUI()
        
    
    }
    
    @objc func showContactsPicker() {
        print("Show Contacts Picker!")
//        let contactsPicker = CNContactPickerViewController()
    
        self.present(contactsPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print("did select!")
        print("\(contact.givenName)")
        person = Person(name: "\(contact.givenName)" + " " + "\(contact.familyName)", phoneNumber: contact.phoneNumbers.first?.value.stringValue)

        SharedData.sharedInstance.people.append(person)
        print("\(SharedData.sharedInstance.people)")
        safeCirclesCollectionView.reloadData()
        updateSelectUI()
        
    }

    // TODO: Add Slide to Delete
    
    @objc func nextTapped() {
        print("Next Tapped!")
    }
    
}
