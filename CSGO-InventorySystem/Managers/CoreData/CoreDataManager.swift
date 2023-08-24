//
//  CoreDataManager.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import Foundation
import CoreData


class CoreDataManger {
    
    static let instance = CoreDataManger()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    private init() {
        container = NSPersistentContainer(name: "WeaponDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try context.save()
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}
