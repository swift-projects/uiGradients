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
    
    lazy var container: UIView = {
        let view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = UIFont(name: "Avenir-Black", size: 24)
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    lazy var colour1: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = UIFont(name: "Menlo", size: 16)
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    lazy var colour2: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.font = UIFont(name: "Menlo", size: 16)
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        container.addSubview(name)
        container.addSubview(colour1)
        container.addSubview(colour2)
        
        updateConstraintsIfNeeded()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        addConstraint(NSLayoutConstraint(item: container, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: container, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        let views = [
            "name": name,
            "colour1": colour1,
            "colour2": colour2
        ]
        
        for view in views.values {
            container.addConstraint(NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: container, attribute: .CenterX, multiplier: 1, constant: 0))
        }
        
        container.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[name]-[colour1]-[colour2]|", options: nil, metrics: nil, views: views))
    }
    
    
    override func drawRect(rect: CGRect) {
        name.text = gradient.name
        colour1.text = "Colour 1: \(gradient.colour1)"
        colour2.text = "Colour 2: \(gradient.colour2)"
        
        let context = UIGraphicsGetCurrentContext()
        let startPoint = bounds.origin
        let endPoint = CGPoint(x: bounds.maxX, y: bounds.maxY)
        let options = CGGradientDrawingOptions()
        
        CGContextDrawLinearGradient(context, gradient.gradient, startPoint, endPoint, options)
    }
    
}
