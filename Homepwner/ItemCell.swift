//
//  ItemCell.swift
//  Homepwner
//
//  Created by sravya chelikani on 11/9/17.
//  Copyright © 2017 Mohu. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var serialNumberLabel : UILabel!
    @IBOutlet var priceLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        priceLabel.adjustsFontForContentSizeCategory = true
    }
}
