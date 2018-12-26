//
//  GCDMain.swift
//  ripple-app
//
//  Created by Tim Ng on 12/26/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping() -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
