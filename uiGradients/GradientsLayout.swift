//
//  GradientsLayout.swift
//  uiGradients
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

class GradientsLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        itemSize = UIScreen.mainScreen().bounds.size
        scrollDirection = .Horizontal
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
