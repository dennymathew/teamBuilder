//
//  AppConstants.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import Foundation

struct AppConstants {
    
    //AppName
    static let appName = "Team Builder"
    
    //Bundle Identifier
    static var bundleIdentifier: String {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            return ""
        }
        
        return bundleId
    }
    
    //Animation Scale
    static let animationScale = 1.0
}
