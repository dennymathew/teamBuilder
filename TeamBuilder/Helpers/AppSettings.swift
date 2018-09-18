//
//  UserDefaults.swift
//  ErudyteDevelopment
//
//  Created by Denny Mathew on 21/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation

// MARK: - Application Settings
@objc private protocol AppSettingsConfigurable {

    static var lastSavedProfileId: Int32 { get set }
    static var lastSavedTechnologyId: Int32 { get set }
    static var lastSavedDesignationId: Int32 { get set }
}

// MARK: - App Settings
class AppSettings: NSObject {
    
    //Set Value
    fileprivate static func updateDefaults(for key: String, value: Any) {
        //Save value to User Defaults
        UserDefaults.standard.set(value, forKey: key)
    }
    
    //Get Value
    fileprivate static func value<T>(for key: String) -> T? {
        //Get value from User Defaults
        return UserDefaults.standard.value(forKey: key) as? T
    }
    
    //Sync UserDefaults
    static func sync() {
        UserDefaults.standard.synchronize()
    }
    
    //Clear UserDefaults
    static func clear() {
        UserDefaults.standard.removePersistentDomain(forName: AppConstants.bundleIdentifier)
        UserDefaults.standard.synchronize()
    }
}

extension AppSettings: AppSettingsConfigurable {

    static var lastSavedProfileId: Int32 {
        get { return AppSettings.value(for: #keyPath(lastSavedProfileId)) ?? 0 }
        set { AppSettings.updateDefaults(for: #keyPath(lastSavedProfileId), value: newValue) }
    }

    static var lastSavedTechnologyId: Int32 {
        get { return AppSettings.value(for: #keyPath(lastSavedTechnologyId)) ?? 0 }
        set { AppSettings.updateDefaults(for: #keyPath(lastSavedTechnologyId), value: newValue) }
    }

    static var lastSavedDesignationId: Int32 {
        get { return AppSettings.value(for: #keyPath(lastSavedDesignationId)) ?? 0 }
        set { AppSettings.updateDefaults(for: #keyPath(lastSavedDesignationId), value: newValue) }
    }
}
