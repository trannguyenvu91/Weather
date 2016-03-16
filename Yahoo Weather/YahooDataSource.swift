//
//  YahooDataSource.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/15/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit
protocol YahooDataSourceDelegate:NSObjectProtocol {
    func yahooDataSource(yahooDataSource:YahooDataSource, didTapItemAtIndexPath indePath: NSIndexPath)
}


class YahooDataSource: NSObject , UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var collectionView: UICollectionView?
    weak var delegate:TodayDataSourceDelegate?
    
    var weekItems = [String]()
    
    // MARK: - Init
    init(collectionView:UICollectionView, delegate:AnyObject , items:Array<String>) {
        
        super.init()
        self.collectionView = collectionView
        self.delegate = delegate as? TodayDataSourceDelegate
        self.weekItems = items
        
        setting()
    }
    
    // MARK: - Common setting
    func setting() {
        
        collectionView?.registerNib(UINib.init(nibName: "YahooHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "YahooHeader")
        collectionView?.registerNib(UINib.init(nibName: "YahooCell", bundle: nil), forCellWithReuseIdentifier: "YahooCell")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CGRectGetWidth(collectionView.frame), 60)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(CGRectGetWidth(collectionView.frame), 200)
    }
    
    // MARK: - UICollectionViewDelegate
    
    
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let dayCell = collectionView.dequeueReusableCellWithReuseIdentifier("YahooCell", forIndexPath: indexPath) as! YahooCell
        return dayCell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "YahooHeader", forIndexPath: indexPath)
        return header
        
        
    }
}
