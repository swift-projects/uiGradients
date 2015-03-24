//
//  GradientCell.swift
//  uiGradients
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

class GradientCell: UICollectionViewCell {
    
    var gradient: Gradient! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = UIFont(name: "Avenir-Black", size: 24)
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(name)
        
        updateConstraintsIfNeeded()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let constraints = [
            NSLayoutConstraint(item: name, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: name, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0),
        ]
        
        addConstraints(constraints)
    }
    
    
    override func drawRect(rect: CGRect) {
        name.text = gradient.name
        
        let context = UIGraphicsGetCurrentContext()
        let startPoint = bounds.origin
        let endPoint = CGPoint(x: bounds.maxX, y: bounds.maxY)
        let options = CGGradientDrawingOptions()
        
        CGContextDrawLinearGradient(context, gradient.gradient, startPoint, endPoint, options)
    }
    
}
