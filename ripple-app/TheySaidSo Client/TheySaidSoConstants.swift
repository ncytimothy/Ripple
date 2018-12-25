//
//  TheySaidSoConstants.swift
//  ripple-app
//
//  Created by Tim Ng on 12/25/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension TheySaidSoClient {
    
    // MARK: Constants
    struct Constants {
        // MARK: - TheySaidSo
        struct TheySaidSo {
            static let APIScheme = "https"
            static let APIHost = "quotes.rest"
            static let AuthHeader = "X-TheySaidSo-Api-Secret"
        }
    }

    // MARK: - TheySaidSo Methods
    struct Methods {
        static let QuoteOfTheDay  = "/qod.json"
        static let RandomQuote = "/quote/random.json"
        static let Categories = "/qod/categories.json"
    }
    
    // MARK: - TheySaidSo Parameter Keys
    struct TheySaidSoParameterKeys {
        static let Category = "category"
    }
    
    // MARK: - TheySaidSo Response Keys
    struct TheySaidSoResponseKeys {
        static let Contents = "contents"
        static let Quotes = "quotes"
        static let Quote = "quote"
        static let Categories = "categories"
        static let Category = "category"
        static let Author = "author"
    }
    
    // MARK: - TheySaidSo Random Quotes Constant
    struct QuoteConstantsForRandom {
        static let randomQuotesConstants: Int = 8
    }
    
    
}
