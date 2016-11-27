

//
//  HikeTableViewCell.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit

class HikeTableViewCell: UITableViewCell {
    
    weak var hikes: Hikes!
    
    @IBOutlet weak var hikeTitle: UILabel!
    @IBOutlet weak var hikeDate: UILabel!
    @IBOutlet weak var hikeLocation: UILabel!
    @IBOutlet weak var hikeImage: UIImageView!
    @IBOutlet weak var hikeDistance: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        func setupCell(_ hikes: Hikes) {
            self.hikes = hikes
            hikeTitle.text = hikes.HikeTitle
            hikeDate.text = hikes.HikeDate
            hikeLocation.text = hikes.HikeLocation
            hikeImage.image = Utils.convertBase64ToImage(base64String: hikes.HikeImage1)
            
           
    }
    
}
