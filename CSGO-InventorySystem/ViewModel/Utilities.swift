//
//  Utilities.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import Foundation

@available(iOS 13.0, *)

public class DatabaseUtils {
    public static func whereIsMySQLite() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print("SQLite File: ")
        print(path ?? "Not Found")
    }
}
