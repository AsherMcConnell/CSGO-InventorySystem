//
//  Background.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Image("csgoBackground")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .blur(radius: 20)
            ZStack {
                Circle()
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 70))
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .fill(Color.black)
                    .frame(width: 80, height: 80)
            }
            .zIndex(10)
            .blur(radius: 5)
            .opacity(0.3)
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
