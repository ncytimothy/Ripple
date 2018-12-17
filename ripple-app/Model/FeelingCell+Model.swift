//
//  FeelingCell+Model.swift
//  ripple-app
//
//  Created by Tim Ng on 12/2/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class Feeling {
    var feelingImageName: String?
    var feelingText: String?
    
   
    
    static func setFeeling(feelingImageName: String?, feelingText: String?) -> Feeling {
        guard let feelingImageName = feelingImageName else { return Feeling() }
        guard let feelingText = feelingText else { return Feeling() }
        
        let feeling = Feeling()
        feeling.feelingImageName = feelingImageName
        feeling.feelingText = feelingText
        
        return feeling
    }
}


