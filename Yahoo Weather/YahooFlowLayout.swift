//
//  YahooFlowLayout.swift
//  Yahoo Weather
//
//  Created by VuVince on 3/16/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class YahooFlowLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        self.registerNib(UINib.init(nibName: "DecorationView", bundle: nil), forDecorationViewOfKind: "DecorationView")
    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)
        let collectionView = self.collectionView
        let offsetY = collectionView?.contentOffset.y
        let headerSize = CGSizeMake(CGRectGetWidth(self.collectionView!.frame), 260)
        
        var newAttributes:Array = [UICollectionViewLayoutAttributes]()
        var isShowHeader = false
        
        for att in attributes! {
            att.zIndex = att.indexPath.row + 1
            if (att.representedElementKind == UICollectionElementKindSectionHeader) {
                var rect:CGRect = CGRectZero
                
                if offsetY <= 0 {
                    rect.origin = CGPointMake(0, 0)
                    rect.size = headerSize
                } else {
                    rect.origin = CGPointMake(0, offsetY!)
                    rect.size = CGSizeMake(headerSize.width, max(100, headerSize.height - offsetY!))
                }
                att.frame = rect
                isShowHeader = true
                
                att.zIndex = 100
            }
            
            newAttributes.append(att)
        }
        
        
        if !isShowHeader {
            let headerAtt = super.layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: NSIndexPath.init(forRow: 0, inSection: 0))
            var rect:CGRect = CGRectZero
            
            if offsetY <= 0 {
                rect.origin = CGPointMake(0, 0)
                rect.size = headerSize
            } else {
                rect.origin = CGPointMake(0, offsetY!)
                rect.size = CGSizeMake(headerSize.width, max(100, headerSize.height - offsetY!))
            }
            headerAtt!.frame = rect
            headerAtt!.zIndex = 100
            newAttributes.append(headerAtt!)
        }
        
        let decoAtt = UICollectionViewLayoutAttributes.init(forDecorationViewOfKind: "DecorationView", withIndexPath: NSIndexPath.init(forRow: 0, inSection: 0))
        var rect:CGRect = CGRectZero
        
        if offsetY <= 0 {
            rect.origin = CGPointMake(0, 0)
            rect.size = headerSize
        } else {
            rect.origin = CGPointMake(0, offsetY!)
            rect.size = CGSizeMake(headerSize.width, max(100, headerSize.height - offsetY!))
        }
        decoAtt.frame = rect
        decoAtt.zIndex = 99
        newAttributes.append(decoAtt)
        
        
        return newAttributes
    }
}
