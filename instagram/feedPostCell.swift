//
//  feedPostCell.swift
//  instagram
//
//  Created by Rey Oliva on 6/28/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit

class feedPostCell: UITableViewCell {

    @IBOutlet weak var abovePhotoProfileName: UILabel!
    @IBOutlet weak var feedPhoto: UIImageView!
    @IBOutlet weak var belowPhotoProfileName: UILabel!
    @IBOutlet weak var feedCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
