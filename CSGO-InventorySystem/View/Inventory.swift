//
//  Inventory.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI
import NavigationRouter

struct Inventory: View {
    
    @EnvironmentObject var csgoVM: InventoryViewModel
    
    @NavRouter var navRouter
    @State var showOpening: Bool = false
    
    @State var blur: CGFloat = 0
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
    ]
    
    var body: some View {
        ZStack {
            ZStack {
                    Background()
                    sideBar
                    gridBackground
                    topBar
                }
            .blur(radius: blur)
            if showOpening {
                openedGunView
            }
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
        HStack {
            Image("sideBar")
                .resizable()
                .frame(width: 35)
                .ignoresSafeArea()
                
            Spacer()
        }
    }
    
    var topBar: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 830, height: 100)
                        .foregroundColor(.black)
                        .opacity(0.1)
                        .padding(.leading, 35)
                    
                    CustomButton(buttonTitle: "Open Case", buttonColor: .green, buttonFont: 40) {
                        navRouter.push(CasePreview())
                    }
                
                }
                Spacer()
            }
    }
    var openedGunView: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .opacity(0.3)
                    .padding(.leading, 35)
                VStack {
                    VStack {
                        Text(csgoVM.currentWeapon!.title)
                            .font(.system(size: 30, weight: .semibold))
                            .frame(width: 400, height:30)
                            .foregroundColor(.white)
                            Rectangle()
                                .fill(Color(csgoVM.currentWeapon!.rarityColor))
                                .frame(width: 400, height: 6)
                            Image(csgoVM.currentWeapon!.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                    }
                    
                    Spacer()
                    CustomButton(buttonTitle: "CLOSE", buttonColor: .green, buttonFont: 20) {
                        blur = 0
                        showOpening = false
                    }

                }
            }
            .frame(width: 630, height: 300)
    }
    
    var gridBackground: some View {
        VStack {
            Spacer()
            ZStack {
                
                inventory
            }
            .frame(width: 830, height: 320)
            .foregroundColor(.black)
            .padding(.leading, 35)
            .padding(.top, 93)
            
        }
    }
    var inventory: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(csgoVM.weapons) { weapon in
                        gunList(weapon: weapon)
                            .onTapGesture {
                                csgoVM.currentWeapon?.imageName = weapon.imageName!
                                csgoVM.currentWeapon?.title = weapon.name!
                                csgoVM.currentWeapon?.rarityColor = weapon.colorRarity!
                                showOpening = true
                                blur = 5
                            }
                    }
                    

                }
            }
        }
    }
    
    func gunList(weapon: WeaponEntity) -> some View {
        VStack {
            HStack(spacing: -1) {
                if let colorRarity = weapon.colorRarity {
                    Rectangle()
                        .fill(Color(colorRarity))
                        .frame(width: 6, height: 90)
                }
                if let image = weapon.imageName {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .background(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.white, Color.black]),
                                center: .bottom,
                                startRadius: 1,
                                endRadius: 190 ))
                        .frame(width: 120,height: 90)
                        .clipped()
                }
            }
            if let name = weapon.name {
                Text(name)
                    .font(.system(size: 10, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height:30)
                    .foregroundColor(.white)
            }
        }
    }
}
