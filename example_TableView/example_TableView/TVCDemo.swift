//
//  TVCDemo.swift
//  example_TableView
//
//  Created by Sergio Redondo on 25/04/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import UIKit

class TVCDemo: UITableViewCell {

    @IBOutlet var lblTitle: UILabel?
    @IBOutlet var img: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
