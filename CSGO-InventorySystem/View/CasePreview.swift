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
            background
            
            ContainerTitleAndImage(caseName: "Dreams & Nightmares", imageName: "DreamsCase", blurRadius: 0, width: 400, height: 150)

            weaponScroll


            if showOpening {
//                CaseCarousel(showOpening: $showOpening)
            }
            midBarWithButton
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
    var background: some View {
        ZStack {
            Image("csgoBackground")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .blur(radius: 10)
            ZStack {
                Circle()
                    .stroke(Color("circleColor"), style: StrokeStyle(lineWidth: 70))
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .fill(Color("circleColor"))
                    .frame(width: 80, height: 80)
            }
            .zIndex(10)
            .blur(radius: 0)
        }
    }
    
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
                            HStack {
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
    
    
    static var gunInventory = [Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               Gun(id: 0, title: "SCAR-20 | Poultrygeist", imageName: "SCAR-20", rarityColor: Color.blue),
                               
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               Gun(id: 1, title: "MAG-7 | Foresight", imageName: "MAG-7", rarityColor: Color.blue),
                               
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               Gun(id: 2, title: "Sawed-Off | Spirit Board", imageName: "Sawed-Off", rarityColor: Color.blue),
                               
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               Gun(id: 3, title: "P2000 | Lifted Spirits", imageName: "P2000", rarityColor: Color.blue),
                               
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               Gun(id: 4, title: "MP5-SD | Necro Jr.", imageName: "MP5-SD", rarityColor: Color.blue),
                               
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               Gun(id: 5, title: "Five-SeveN | Scrawl", imageName: "Five-Seven", rarityColor: Color.blue),
                               
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               Gun(id: 6, title: "MAC-10 | Ensnared", imageName: "MAC-10", rarityColor: Color.blue),
                               
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("purple")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("purple")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("purple")),
                               Gun(id: 7, title: "XM1014 | Zombie Offensive", imageName: "XM1014", rarityColor: Color("purple")),
                               
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("purple")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("purple")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("purple")),
                               Gun(id: 8, title: "G3SG1 | Dream Glade", imageName: "GSSG1", rarityColor: Color("purple")),
                               
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("purple")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("purple")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("purple")),
                               Gun(id: 9, title: "PP-Bizon | Space Cat", imageName: "PP-Bizon", rarityColor: Color("purple")),
                               
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("purple")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("purple")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("purple")),
                               Gun(id: 10, title: "USP-S | Ticket to Hell", imageName: "USP-S", rarityColor: Color("purple")),
                               
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("purple")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("purple")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("purple")),
                               Gun(id: 11, title: "M4A1-S | Night Terror", imageName: "M4A1-S", rarityColor: Color("purple")),
                               
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("hotPink")),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("hotPink")),
                               Gun(id: 12, title: "MP7 | Abyssal Apparition", imageName: "MP7", rarityColor: Color("hotPink")),
                               
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("hotPink")),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("hotPink")),
                               Gun(id: 13, title: "FAMAS | Rapid Eye Movement", imageName: "FAMAS", rarityColor: Color("hotPink")),
                               
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("hotPink")),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("hotPink")),
                               Gun(id: 14, title: "Dual Berettas | Melondrama", imageName: "Dual Berettas", rarityColor: Color("hotPink")),
                               
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: Color.red),
                               Gun(id: 15, title: "MP9 | Starlight Protector", imageName: "MP9", rarityColor: Color.red),
                               
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: Color.red),
                               Gun(id: 16, title: "AK-47 | Nightwish", imageName: "AK-47", rarityColor: Color.red),
                               
                               Gun(id: 17, title: "KNIFE", imageName: "KNIFE", rarityColor: Color.yellow)].shuffled()
}
