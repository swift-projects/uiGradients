//
//  UIColorExtensions.swift
//  uiGradients
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = NSScanner(string: hex)
        var hex: UInt32 = 0
        
        scanner.charactersToBeSkipped = NSCharacterSet(charactersInString: "#")
        scanner.scanHexInt(&hex)
        
        let red   = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00)  >> 8)  / 255
        let blue  = CGFloat((hex & 0xFF))         / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
