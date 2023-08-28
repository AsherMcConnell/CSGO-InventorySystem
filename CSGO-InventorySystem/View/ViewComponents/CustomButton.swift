//
//  CustomButton.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI


struct CustomButton: View {
    
    var buttonTitle: String
    var buttonColor: Color
    var buttonFont: Double
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonTitle)
                .buttonStyle(.bordered)
                .foregroundColor(Color.white)
                .font(.system(size: buttonFont))
                .padding(.all,6)
                .bold()
                .background(buttonColor)
                .cornerRadius(5)
                .zIndex(10)
                .offset(y: -5)
        }
    }
}
