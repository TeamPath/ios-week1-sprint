

//
//  HikeTableViewCell.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit

class HikeTableViewCell: UITableViewCell {
    
    weak var hike: Hike!
    
    @IBOutlet weak var hikeTitle: UILabel!
    @IBOutlet weak var hikeDate: UILabel!
    @IBOutlet weak var hikeLocation: UILabel!
    @IBOutlet weak var hikeDiscription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(_ hike:Hike) {
        hikeTitle.text = hike.hikeName
        hikeDate.text = String(describing: hike.date)
        hikeLocation.text = hike.hikeLocation
        hikeDiscription.text = hike.hikeDiscription
    }
}
