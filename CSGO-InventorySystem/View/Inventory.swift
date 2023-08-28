//
//  Inventory.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI

struct Inventory: View {
    
    @StateObject var csgoVM = InventoryViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
        GridItem(.flexible(), spacing: -60, alignment: nil),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                sideBar
                gridBackground
                topBar
            
            }
        }
        .environmentObject(csgoVM)
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
                    
                    
                    NavigationLink {
                        CasePreview()
                    } label: {
                        Text("SPIN TO WIN")
                            .font(.system(size: 50))
                    }
                }
                Spacer()
            }
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
