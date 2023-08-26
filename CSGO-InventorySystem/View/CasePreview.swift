//
//  CaseOpening.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import SwiftUI

struct CasePreview: View {
    
    @State var showOpening: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            ContainerTitleAndImage(caseName: "Dreams & Nightmares", imageName: "DreamsCase", blurRadius: 0, width: 400, height: 150)
            weaponScroll
            midBarWithButton
            if showOpening {
                CaseOpening(showOpening: $showOpening)
            }
        }
        .onAppear {
            DatabaseUtils.whereIsMySQLite()
        }
    }
}

struct CaseOpeningAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CasePreview()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}

// MARK: - VIEWS

extension CasePreview {
    
    var midBarWithButton: some View {
        HStack {
            Spacer()
            VStack(spacing: -2) {
                HStack {
                    Text("Items that might be in this container:")
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading, 50)
                    
                    Spacer()
                    
                    CustomButton(buttonTitle: "UNLOCK CONTAINER", buttonColor: .green, buttonFont: 14) {
                        showOpening.toggle()
                        Gun.gunInventory.shuffle()
                        Gun.gunInventory.remove(at: 83)
                        Gun.gunInventory.insert(Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: Color.yellow), at: 83)
                    }
                    .padding(.trailing, 50)
                }
                
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.gray, Color.white]),center: .center, startRadius:1, endRadius: 200))
                    .frame(width: UIScreen.main.bounds.width, height: 1,alignment: .center)
                    .ignoresSafeArea()
            }
            .padding(.bottom, 30)
        }
    }

    var weaponScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer()
            HStack(alignment: .top, spacing: 5) {
                ForEach(Gun.gunsForDreamsNightmaresCaseScroll) { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        
                        VStack {
                            HStack(spacing: -1) {
                                Rectangle()
                                    .fill(num.rarityColor)
                                    .frame(width: 6, height: 90)
                                Image(num.imageName)
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
                            Text(num.title)
                                .font(.system(size: 10, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height:30)
                                .foregroundColor(.white)
                        }
                        .scaleEffect(.init(width: scale, height: scale))
                        .padding(.vertical)
                    }
                    .frame(width: 120, height: 90)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    
                }
            }
            .padding(.bottom, 40)
        }
    }
}

// MARK: - FUNCS

extension CasePreview {
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midpoint: CGFloat = UIScreen.main.bounds.width / 2
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midpoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }
}
