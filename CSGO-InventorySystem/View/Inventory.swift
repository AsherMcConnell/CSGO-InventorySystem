//
//  Inventory.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI

struct Inventory: View {
    
    @StateObject var csgoVM = InventoryViewModel()
    
    var body: some View {
        ZStack {
            sideBar
            topBar
            
        }
    }
}

struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        Inventory()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


// MARK: VIEWS

extension Inventory {
    var sideBar: some View {
        Image("csgoBackground")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
    
    var topBar: some View {
        VStack {
            Rectangle()
                .frame(width: 600, height: 100)
                .foregroundColor(.black)
                .opacity(0.3)
                
            Spacer()
        }
    }
}
