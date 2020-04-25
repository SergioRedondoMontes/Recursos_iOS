//
//  CVCDemo.swift
//  example_collectionView
//
//  Created by Sergio Redondo on 25/04/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var img: UIImageView!
    
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Model){
        self.lblTitle.text = model.text
        self.img.image = UIImage(named: model.imageName)
        self.img.contentMode = .scaleAspectFit
    }

}
