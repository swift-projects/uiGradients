//
//  Gradient.swift
//  uiGradients
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation

class Gradient {
    let name: String
    let colour1: String
    let colour2: String
    
    class func all() -> [Gradient] {
        let path = NSBundle.mainBundle().pathForResource("gradients", ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as [[String: AnyObject]]
        
        return json.map { (data: [String: AnyObject]) -> Gradient in
            return Gradient(data: data)
        }
    }
    
    init(data: [String: AnyObject]) {
        name = data["name"] as String
        colour1 = data["colour1"] as String
        colour2 = data["colour2"] as String
    }
}