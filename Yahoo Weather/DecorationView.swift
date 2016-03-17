//
//  DecorationView.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/16/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class DecorationView: UICollectionReusableView {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heightConstraint.constant = UIScreen.mainScreen().bounds.size.height
        self.setNeedsDisplay()
        self.layoutIfNeeded()
    }
    
}
