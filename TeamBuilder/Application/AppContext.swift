//
//  AppContext.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import Foundation

class AppContext {
    
    static let shared = AppContext()
    private init(){}
    
    //Observers
    var keyboardWillShowObserver: NSObjectProtocol?
    var keyboardWillHideObserver: NSObjectProtocol?
}
