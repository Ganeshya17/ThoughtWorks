//
//  MobileCell.swift
//  DemoThought
//
//  Created by Zencode Developer on 20/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import UIKit

class MobileCell: UITableViewCell {

    @IBOutlet weak var img_Product: UIImageView!
    @IBOutlet weak var lbl_ProductName: UILabel!
    @IBOutlet weak var lbl_ProductPrice: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblWishListCount: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
