//
//  CaseOpening.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI
import AVKit

struct CaseOpening: View {
    
    @Environment(\.presentationMode) var presentationMode
//    @Binding var showOpening: Bool
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
            
//            Background(circleBackgroundBlur: 5)
//                .zIndex(-1)
            
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

extension CaseOpening {
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
    var closeButton: some View {
        Button {
//            showOpening.toggle()
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
    
    var gradientBlur: some View {
        HStack {
            ZStack(alignment: .bottom) {
                Image("csgoBackground")
                    .resizable()
                    .blur(radius: 20)
                    .padding(-20)
                    .clipped()
                    .mask(gradient)
                
                gradient
            }
        }
        .zIndex(40)
    }
}

// MARK: - FUNCS

extension CaseOpening {
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


struct CaseOpening_Previews: PreviewProvider {
    static var previews: some View {
        CaseOpening()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
