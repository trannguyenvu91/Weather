//
//  ViewController.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/15/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var yahooDataSource:YahooDataSource?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        yahooDataSource = YahooDataSource(collectionView: collectionView, delegate: self, items: ["Hihi", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate", "OK", "Greate"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return .Slide
    }
}

