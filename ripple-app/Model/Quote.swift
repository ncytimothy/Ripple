//
//  Quote.swift
//  ripple-app
//
//  Created by Tim Ng on 12/25/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation

public struct Quote {
    var quoteString: String? = QuoteConstants.Quote
    var author: String? = QuoteConstants.Author
    var category: String? = QuoteConstants.Category
    var categories: [String]? = [QuoteConstants.Categories]
    
    init(dictionary: [String:AnyObject]) {
        quoteString = dictionary[TheySaidSoClient.TheySaidSoResponseKeys.Quote] as? String
        author = dictionary[TheySaidSoClient.TheySaidSoResponseKeys.Author] as? String
        category = dictionary[TheySaidSoClient.TheySaidSoResponseKeys.Category] as? String
        categories = dictionary[TheySaidSoClient.TheySaidSoResponseKeys.Categories] as? [String]
    }
    
    static func quoteFromResult(_ result: [String:AnyObject]) -> Quote {
        let quote = Quote(dictionary: result)
        return quote
    }
    
    static func randomQuoteFromResult(_ result: [String:AnyObject]) -> Quote {
        var quote = Quote(dictionary: result)
        print("quote in randomQuoteFromResult: \(quote)")
        guard let categories = quote.categories else { return quote }
        guard (categories.isEmpty != true) else { return quote }
        quote.category = categories[0]
        return quote
    }
}
