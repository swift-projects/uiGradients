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
            render()
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
    
    func render() {
        name.text = gradient.name
    }
    
}
