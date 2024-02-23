//
//  Gun.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import Foundation
import SwiftUI


struct Gun: Identifiable {
        
    var id: Int
    var title: String
    var imageName: String
    var rarityColor: String
    
    static var gunsForDreamsNightmaresCaseScroll = [
        Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
        Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor:"BlueRarity"),
        Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
        Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
        Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
        Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
        Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
        Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: "PurpleRarity"),
        Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: "PurpleRarity"),
        Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: "PurpleRarity"),
        Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor:"PurpleRarity"),
        Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: "PurpleRarity"),
        Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: "PinkRarity"),
        Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: "PinkRarity"),
        Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: "PinkRarity"),
        Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: "RedRarity"),
        Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: "RedRarity"),
        Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: "YellowRarity")
    ]
    
    
    static var gunInventory = [Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: "BlueRarity"),
                            
                               
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: "BlueRarity"),
                             
                               
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: "BlueRarity"),
                        
                               
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: "BlueRarity"),
                          
                               
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: "BlueRarity"),
                             
                               
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: "BlueRarity"),
               
                               
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: "BlueRarity"),
                          
                               
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: "PurpleRarity"),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: "PurpleRarity"),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: "PurpleRarity"),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: "PurpleRarity"),
                               
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: "PurpleRarity"),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: "PurpleRarity"),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: "PurpleRarity"),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: "PurpleRarity"),
                               
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: "PurpleRarity"),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: "PurpleRarity"),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: "PurpleRarity"),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: "PurpleRarity"),
                               
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: "PurpleRarity"),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: "PurpleRarity"),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: "PurpleRarity"),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: "PurpleRarity"),
                               
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: "PurpleRarity"),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: "PurpleRarity"),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: "PurpleRarity"),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: "PurpleRarity"),
                               
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: "PinkRarity"),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: "PinkRarity"),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: "PinkRarity"),
                               
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: "PinkRarity"),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: "PinkRarity"),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: "PinkRarity"),
                               
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: "PinkRarity"),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: "PinkRarity"),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: "PinkRarity"),
                               
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: "RedRarity"),
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: "RedRarity"),
                               
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: "RedRarity"),
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: "RedRarity"),
                               
                               Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: "YellowRarity")]
}
