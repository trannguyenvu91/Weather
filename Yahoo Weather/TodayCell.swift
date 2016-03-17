//
//  TodayCell.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/15/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clearColor()
    }

}
