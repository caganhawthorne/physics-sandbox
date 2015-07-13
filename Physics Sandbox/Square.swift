//
//  Square.swift
//  Physics Sandbox
//
//  Created by Connor Pan on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class Square: UIView {

    var dynamicBehavior = UIDynamicItemBehavior()
    var square = UIView()
    
    var elasticity = 1.0
    var density = 100
    var resistance = 10
    var friction = 1
    
    init(x: CGFloat, y: CGFloat) {
        super.init(frame: CGRectMake(x, y, 75, 75))
        self.backgroundColor = UIColor.blueColor()
        dynamicBehavior = UIDynamicItemBehavior(items: [self])
        dynamicBehavior.allowsRotation = true
        dynamicBehavior.elasticity = CGFloat(elasticity)
        dynamicBehavior.density = CGFloat(density)
        dynamicBehavior.resistance = CGFloat(resistance)
        dynamicBehavior.friction = CGFloat(friction)
        print("square test")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
