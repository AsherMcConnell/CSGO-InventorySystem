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
    var rarityColor: Color
    
    static var gunsForDreamsNightmaresCaseScroll = [
        Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
        Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
        Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
        Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
        Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
        Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
        Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
        Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("purple")),
        Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("purple")),
        Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("purple")),
        Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("purple")),
        Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("purple")),
        Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("hotPink")),
        Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("hotPink")),
        Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("hotPink")),
        Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: Color.red),
        Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: Color.red),
        Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: Color.yellow)
    ]
    
    
    static var gunInventory = [Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color("BlueRarity")),
                            
                               
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color("BlueRarity")),
                             
                               
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color("BlueRarity")),
                        
                               
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color("BlueRarity")),
                          
                               
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color("BlueRarity")),
                             
                               
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color("BlueRarity")),
               
                               
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color("BlueRarity")),
                          
                               
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("PurpleRarity")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("PurpleRarity")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("PurpleRarity")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("PurpleRarity")),
                               
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("PurpleRarity")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("PurpleRarity")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("PurpleRarity")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("PurpleRarity")),
                               
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("PurpleRarity")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("PurpleRarity")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("PurpleRarity")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("PurpleRarity")),
                               
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("PurpleRarity")),
                               
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("PurpleRarity")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("PurpleRarity")),
                               
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("PinkRarity")),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("PinkRarity")),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("PinkRarity")),
                               
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("PinkRarity")),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("PinkRarity")),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("PinkRarity")),
                               
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("PinkRarity")),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("PinkRarity")),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("PinkRarity")),
                               
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: Color("RedRarity")),
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: Color("RedRarity")),
                               
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: Color("RedRarity")),
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: Color("RedRarity")),
                               
                               Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: Color("YellowRarity"))]
}
