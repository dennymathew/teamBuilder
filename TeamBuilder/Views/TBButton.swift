//
//  TBButton.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

class TBButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCurvedCorners()
    }
    
    fileprivate func setupCurvedCorners() {
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
    }
}
