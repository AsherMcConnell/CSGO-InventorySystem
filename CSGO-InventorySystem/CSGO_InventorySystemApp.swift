//
//  CSGO_InventorySystemApp.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import SwiftUI
import NavigationRouter

@main
struct CSGO_InventorySystemApp: App {
    
    @NavRouter var navRouter
    @StateObject var csgoVM = InventoryViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationRouter {
                Inventory()
                    .navigatesTo(CasePreview.self, usesBackButton: false, usesBackSwipe: false)
            }
            .environmentObject(csgoVM)
        }
        
    }
}
