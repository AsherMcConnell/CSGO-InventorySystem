//
//  CaseTitleAndImage.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI

struct ContainerTitleAndImage: View {
    
    var caseName: String
    var imageName: String
    var blurRadius: CGFloat
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack {
            Text("Unlock Container")
                .font(.system(size: 25))
            
            HStack {
                Text("Unlock")
                    .font(.system(size: 13))
                Text("\(caseName) case")
                    .font(.system(size: 14))
                    .bold()
            }
            
            HStack {
                Image(uiImage: .init(systemName: "info.circle.fill")!)
                    .resizable()
                    .frame(width: 10, height: 10)
                
                Text("This Container can only be opened once")
                    .font(.system(size: 10))
                    .padding(.top, 3)
            }
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .blur(radius: blurRadius)
            
            Spacer()
        }
        .padding(.top, 30)
        .foregroundColor(Color.init(hue: 0, saturation: 0.1, brightness: 1))
    }
}
