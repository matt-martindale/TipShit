//
//  CoreDataStack.swift
//  TipShit
//
//  Created by Matthew Martindale on 6/1/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    //This is a shared instance of the Core Data Stack
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        
       let container = NSPersistentContainer(name: "Tip")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
