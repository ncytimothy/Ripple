//
//  DataController.swift
//  ripple-app
//
//  Created by Tim Ng on 12/26/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Setup Core Data Stack
// Actual hold initialization in AppDelegate

class DataController {
    
    // MARK: - Persistence Container Property
    // 1. Hold a persistence container instance
    let persistenceContainer: NSPersistentContainer
    
    // Initialize DataController with a persistence container
    init(modelName: String) {
        persistenceContainer = NSPersistentContainer(name: modelName)
    }
    
    // 2. Help load the persistence store (with helper)
    // load(completion:) takes an empty optional closure and defaulted to nil
    func load(completion: (() -> Void)? = nil) {
        persistenceContainer.loadPersistentStores { (storeDescription, error) in
            // 2.1 Guard for loading persistent stores errors
            guard (error == nil) else {
                fatalError(error!.localizedDescription)
            }
            // TODO: Perhaps we can implement autosave, but not for now
            completion?()
        }
    }

    // 3. Help access the context (managedContext)
    var viewContext: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
}

//TODO: Autosave Implementation in Extension
