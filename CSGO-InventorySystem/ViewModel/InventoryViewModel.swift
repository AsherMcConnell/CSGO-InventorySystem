//
//  InventoryViewModel.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import Foundation


class InventoryViewModel: ObservableObject {
    
    @Published var weapons: [WeaponEntity] = []
    
    @Published var currentWeapon: WeaponEntity? = nil
    
    init() {
        getWeapons()
    }
    
    // Create New Weapon to add to inventory
    func createWeapon(name: String) {
        let context = CoreDataManger.instance.context
        let newWeapon = WeaponEntity(context: context)
        
        newWeapon.name = name
        newWeapon.id = UUID()
        
        CoreDataManger.instance.saveData()
        getWeapons()
    }

    // Get List of Weapons
    func getWeapons() {
        do {
            let request = WeaponEntity.fetchRequest()
            let context = CoreDataManger.instance.context
            
            try weapons = context.fetch(request)
            print("Successfully got weapons")
        } catch let error {
            print("Error fetching weapons: \(error)")
        }
    }
}
