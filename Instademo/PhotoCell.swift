//
//  PhotoCell.swift
//  Instademo
//
//  Created by appinventiv on 07/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var imageNamesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var imagesUIimageView: UIImageView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
