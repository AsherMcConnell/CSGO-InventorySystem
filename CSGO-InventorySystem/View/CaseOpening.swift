//
//  CaseOpening.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/24/23.
//

import SwiftUI
import AVKit
import NavigationRouter

struct CaseOpening: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var csgoVM: InventoryViewModel
    
    @NavRouter var navRouter

    @Binding var showOpening: Bool
    
    @State var isAnimated: Bool = false
    @State var isShuffled: Bool = false
    @State var showOpenedGun = false
    @State var blur: CGFloat = 0
    
    var audio: AVAudioPlayer?
    let gradient = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: .black, location: 0),
        .init(color: .clear, location: 0.2)
    ]),
    startPoint: .bottom,
    endPoint: .top)
    
    var body: some View {
        ZStack {
            ZStack {
                Background()
                    .zIndex(-1)
                ContainerTitleAndImage(caseName: "Dreams & Nightmares", imageName: "DreamsCase", blurRadius: 6, width: 800, height: 280)
                VStack() {
                    gunSpinAnimation
                    Spacer()
                }
            }
            .blur(radius: blur)
            
            if showOpenedGun {
                openedGunView
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isAnimated.toggle()
            SoundManager.instance.playSound(sound: .caseOpenSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.25) {
                showOpenedGun = true
                blur = 5
            }
        }
    .zIndex(100)
    }
}

// MARK: - VIEWS

extension CaseOpening {
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
                        showOpening.toggle()
                        Gun.gunInventory.remove(at: 89)
                        blur = 0
                        navRouter.popToRoot()
                    }

                }
            }
            .frame(width: 630, height: 300)
    }
    var gunSpinAnimation: some View {
        ZStack {
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
                                        .background(
                                            RadialGradient(
                                                gradient: Gradient(colors: [Color.white, Color.black]),
                                                center: .bottom,
                                                startRadius: 1,
                                                endRadius: 190 ))
                                        .frame(width: 150,height: 100)
                                        .clipped()
                                    Rectangle()
                                        .fill(Color(num.rarityColor))
                                        .frame(width: 150, height: 7)
                                }
                            }
                        }
                        .scaleEffect(.init(width: scale, height: scale))
                        .offset(x: isAnimated ? -80 : 10000)
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

