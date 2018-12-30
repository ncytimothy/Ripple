//
//  FeelingCell+Model.swift
//  ripple-app
//
//  Created by Tim Ng on 12/2/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class FeelingNoCD {
    var feelingImageName: String?
    var feelingText: String?
    
    
    static func setFeeling(feelingImageName: String?, feelingText: String?) -> FeelingNoCD {
        guard let feelingImageName = feelingImageName else { return FeelingNoCD() }
        guard let feelingText = feelingText else { return FeelingNoCD() }
        
        let feeling = FeelingNoCD()
        feeling.feelingImageName = feelingImageName
        feeling.feelingText = feelingText
        
        return feeling
    }
}


