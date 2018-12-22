//
//  PersonStorage.swift
//  ripple-app
//
//  Created by Tim Ng on 12/22/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation

class SharedData {
    static let sharedInstance = SharedData()
    var people = [Person]()
    private init() {}
}
