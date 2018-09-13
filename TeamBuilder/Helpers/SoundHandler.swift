//
//  SoundHandler.swift
//  Erudyte
//
//  Created by Denny Mathew on 6/11/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import AVFoundation

class SoundHandler {
    
    static let systemSoundID: SystemSoundID = 1007
    
    static func play() {
        AudioServicesPlaySystemSound (systemSoundID)
    }
}
