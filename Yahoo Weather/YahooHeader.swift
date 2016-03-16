//
//  YahooHeaderView.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/15/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class YahooHeader: UICollectionReusableView {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highestLabel: UILabel!
    @IBOutlet weak var lowestLabel: UILabel!
    
    var todayDataSource:TodayDataSource?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        todayDataSource = TodayDataSource(collectionView: collectionView, delegate: self, items: ["Hihi", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate"])
        
        backgroundColor = UIColor.clearColor()
        collectionView.backgroundColor = UIColor.clearColor()
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        let size = layoutAttributes.frame.size
        let percent = (size.height - 180) / 80
        
        
        titleLabel.alpha = percent
        dateLabel.alpha = percent
        highestLabel.alpha = percent
        lowestLabel.alpha = percent
    }
    
}
