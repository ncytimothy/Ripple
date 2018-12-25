//
//  QuoteStorage.swift
//  ripple-app
//
//  Created by Tim Ng on 12/25/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation

class QuoteSharedData {
    
    static let sharedInstance = QuoteSharedData()
    var Quotes = [Quote]()
    private init() {}
    
}
