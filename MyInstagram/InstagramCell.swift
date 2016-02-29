//
//  InstagramCell.swift
//  MyInstagram
//
//  Created by Jiayi Kou on 2/28/16.
//  Copyright © 2016 Jiayi Kou. All rights reserved.
//

import UIKit

class InstagramCell: UITableViewCell {
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet var captionLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
