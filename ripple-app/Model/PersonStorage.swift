//
//  PersonStorage.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation

class PersonSharedData {
    static let sharedInstance = PersonSharedData()
    var people = [Person]()
    private init() {}
}
