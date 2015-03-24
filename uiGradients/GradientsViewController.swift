//
//  GradientsViewController.swift
//  uiGradients
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class GradientsViewController: UICollectionViewController {
    
    let gradients = Gradient.all()
    
    convenience override init() {
        let layout = GradientsLayout()
        self.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.registerClass(GradientCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView!.pagingEnabled = true
        collectionView!.showsHorizontalScrollIndicator = false
        collectionView!.showsVerticalScrollIndicator = false
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gradients.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as GradientCell
        
        cell.gradient = gradients[indexPath.item]
        
        return cell
    }

}
