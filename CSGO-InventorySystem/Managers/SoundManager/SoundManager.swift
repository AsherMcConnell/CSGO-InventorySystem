//
//  SoundManager.swift
//  CSGO-InventorySystem
//
//  Created by Asher McConnell on 8/23/23.
//

import Foundation
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case caseOpenSound
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
