//
//  TBTableViewCell.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/17/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

class TBTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundifyImageView()
    }

    private func roundifyImageView() {
        ivThumbnail.layer.cornerRadius = ivThumbnail.frame.height/2
        ivThumbnail.layer.masksToBounds = true
    }
}
