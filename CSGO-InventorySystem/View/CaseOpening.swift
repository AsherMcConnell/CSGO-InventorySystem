//
//  CaseOpening.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import SwiftUI

struct CaseOpeningAnimation: View {
    
    @State var showOpening: Bool = false
    
    var body: some View {
        ZStack {
            Background(circleBackgroundBlur: 0)
                .zIndex(-1)
            
            ContainerTitleAndImage(caseName: "Dreams & Nightmares", imageName: "DreamsCase", blurRadius: 0, width: 400, height: 150)
                .zIndex(1)
            
            midBarWithButton
                .zIndex(11)
                .padding(.top, 100)
            
            weaponScroll
                .zIndex(10)
                
            if showOpening {
                CaseCarousel(showOpening: $showOpening)
                    .padding(.top, 21)
            }
        }
    }
}

struct CaseOpeningAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CaseOpeningAnimation()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

// MARK: - VIEWS

extension CaseOpeningAnimation {
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
}

extension CaseOpeningAnimation {
    var weaponScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer()
            HStack(alignment: .top, spacing: 5) {
                ForEach(Gun.gunsForDreamsNightmaresCaseScroll) { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Rectangle()
                                    .fill(num.rarityColor)
                                    .frame(width: 6, height: 90)
                                Image(num.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .background(RadialGradient(gradient:
                                                                Gradient(colors: [Color.white, Color.black]),
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

extension CaseOpeningAnimation {
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

struct Background: View {
    
    var circleBackgroundBlur: CGFloat
    
    var body: some View {
        ZStack {
            Image("csgoBackground")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .blur(radius: 10)
                .zIndex(-10)
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
            .blur(radius: circleBackgroundBlur)
        }
    }
}

struct ContainerTitleAndImage: View {
    
    var caseName: String
    var imageName: String
    var blurRadius:CGFloat
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Unlock Container")
                .font(.system(size: 25))
            
            HStack(spacing: 3){
                Text("Unlock")
                    .font(.system(size: 13))
                Text("\(caseName) case")
                    .font(.system(size: 14))
                    .bold()
            }
            
            HStack(spacing: 3) {
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

import AVKit


struct CaseCarousel: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showOpening: Bool
    @State var isAnimated: Bool = false
    
    var audio: AVAudioPlayer?
    @State var isShuffled: Bool = false
    
    let gradient = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: .black, location: 0),
        .init(color: .clear, location: 0.2)
    ]),
    startPoint: .bottom,
    endPoint: .top)
    
    var body: some View {
        ZStack {
            
            Background(circleBackgroundBlur: 5)
                .zIndex(-1)
            
            ContainerTitleAndImage(caseName: "Dreams & Nightmares", imageName: "DreamsCase", blurRadius: 6, width: 800, height: 280)
            
            VStack {
                closeButton
                gunSpinAnimation
                Spacer()
            }
        }
        .onAppear {
            isAnimated.toggle()
            SoundManager.instance.playSound(sound: .caseOpenSound)
        }
        .zIndex(100)
    }
}

// MARK: - VIEWS

extension CaseCarousel {
    var gunSpinAnimation: some View {
        HStack(alignment: .top, spacing: 5) {
            ForEach(Gun.gunInventory) { num in
                GeometryReader { proxy in
                    let scale = getScale(proxy: proxy)
                    
                    VStack(spacing: 8) {
                        Spacer(minLength: 120)
                        ZStack {
                            VStack(spacing: 0) {
                                Image(num.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]),
                                                               center: .bottom,
                                                               startRadius: 1,
                                                               endRadius: 190 ))
                                    .frame(width: 150,height: 100)
                                    .clipped()
                                Rectangle()
                                    .fill(num.rarityColor)
                                    .frame(width: 150, height: 7)
                            }
                        }
                    }
                    .scaleEffect(.init(width: scale, height: scale))
                    .offset(x: isAnimated ? 10 : 10000)
                    .animation(.easeOut(duration: 6), value: isAnimated)
                    .padding(.vertical)
                }
                .frame(width: 150, height: 180)
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
            }
            Spacer()
                .frame(width: 16)
        }
    }
}

extension CaseCarousel {
    var closeButton: some View {
        Button {
            showOpening.toggle()
        } label: {
            Text("CLOSE")
                .buttonStyle(.bordered)
                .foregroundColor(Color.white)
                .font(.system(size: 13))
                .padding(.all,6)
                .bold()
                .background(Color.green)
                .cornerRadius(5)
        }
    }
}

extension CaseCarousel {
    var gradientBlur: some View {
        HStack {
            ZStack(alignment: .bottom) {
                Image("csgoBackground")
                    .resizable()
                    .blur(radius: 20) /// blur the image
                    .padding(-20) /// expand the blur a bit to cover the edges
                    .clipped() /// prevent blur overflow
                    .mask(gradient) /// mask the blurred image using the gradient's alpha values
                
                gradient /// also add the gradient as an overlay (this time, the purple will show up)
            }
        }
        .zIndex(40)
    }
}

// MARK: - FUNCS

extension CaseCarousel {
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
