//
//  TBTextField.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

class TBTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCustomPlaceholder()
    }
    
    fileprivate func setupCustomPlaceholder() {
        attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "" , attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}
