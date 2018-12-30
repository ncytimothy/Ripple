//
//  FeelingCell+Model.swift
//  ripple-app
//
//  Created by Tim Ng on 12/2/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class FeelingDisplay {
    var feelingImageName: String?
    var feelingText: String?
    
    
    static func setFeeling(feelingImageName: String?, feelingText: String?) -> FeelingDisplay {
        guard let feelingImageName = feelingImageName else { return FeelingDisplay() }
        guard let feelingText = feelingText else { return FeelingDisplay() }
        
        let feeling = FeelingDisplay()
        feeling.feelingImageName = feelingImageName
        feeling.feelingText = feelingText
        
        return feeling
    }
}


