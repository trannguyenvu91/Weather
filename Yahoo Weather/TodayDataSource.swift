//
//  TodayDataSource.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/15/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

protocol TodayDataSourceDelegate:NSObjectProtocol {
    func todayDataSource(todayDataSource:TodayDataSource, didTapItemAtIndexPath indePath: NSIndexPath)
}

class TodayDataSource: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView?
    weak var delegate:TodayDataSourceDelegate?
    
    var todayItems = [String]()
    
    // MARK: - Init
    init(collectionView:UICollectionView, delegate:AnyObject , items:Array<String>) {
        
        super.init()
        self.collectionView = collectionView
        self.delegate = delegate as? TodayDataSourceDelegate
        self.todayItems = items
        
        setting()
    }
    
    // MARK: - Common setting
    func setting() {
        
        collectionView?.registerNib(UINib.init(nibName: "TodayCell", bundle: nil), forCellWithReuseIdentifier: "TodayCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(60, 96)
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let todayCell = collectionView.dequeueReusableCellWithReuseIdentifier("TodayCell", forIndexPath: indexPath) as! TodayCell
        
        todayCell.timeLabel.text = "\(indexPath.row)"
        todayCell.tempLabel.text = todayItems[indexPath.row]
        
        return todayCell
    }
}
