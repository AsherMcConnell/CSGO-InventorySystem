//
//  InventoryViewModel.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import Foundation


class InventoryViewModel: ObservableObject {
    
    @Published var weapons: [WeaponEntity] = []
    
    @Published var currentWeapon: Gun?
    @Published var currentWeaponEntity: WeaponEntity?
    
    init() {
        getWeapons()
    }
    
    // Create New Weapon to add to inventory
    func createWeapon(name: String, imageName: String, colorRarity: String) {
        let context = CoreDataManger.instance.context
        let newWeapon = WeaponEntity(context: context)
        
        newWeapon.name = name
        newWeapon.nickname = "Nickname"
        newWeapon.imageName = imageName
        newWeapon.colorRarity = colorRarity
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
    
    func sellWeapon() {
        if let currentWeaponEntity {
            CoreDataManger.instance.context.delete(currentWeaponEntity)
            CoreDataManger.instance.saveData()
            getWeapons()
        }
        currentWeaponEntity = nil
    }
    
    func editWeaponName(name: String) {
        if let currentWeaponEntity {
            currentWeaponEntity.nickname = name
            CoreDataManger.instance.saveData()
        }
        currentWeaponEntity = nil
    }
}
