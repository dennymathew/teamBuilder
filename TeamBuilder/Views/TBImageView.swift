//
//  TBImageView.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

class TBImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlyfyImageView()
    }
    
    fileprivate func circlyfyImageView() {
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
}
