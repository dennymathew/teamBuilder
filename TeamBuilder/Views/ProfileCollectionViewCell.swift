//
//  ProfileCollectionViewCell.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/14/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    var model: ProfileCellModel? {
        didSet {
            ivProfile.image = model?.imgProfile
            lblTitle.text = model?.title ?? ""
        }
    }

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct ProfileCellModel {
    var imgProfile: UIImage?
    var title: String?
}
