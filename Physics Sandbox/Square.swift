//
//  Square.swift
//  Physics Sandbox
//
//  Created by Connor Pan on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class Square: UIView {

    var squareBehaviors = UIDynamicItemBehavior()
    var square = UIView()
    
    
    var elasticity = 1.0
    var density = 100
    var resistance = 10
    var friction = 1
    
    init(x: CGFloat, y: CGFloat) {
        super.init(frame: CGRectMake(x, y, 75, 75))
        self.backgroundColor = UIColor.blueColor()
        squareBehaviors = UIDynamicItemBehavior(items: [self])
        squareBehaviors.allowsRotation = true
        squareBehaviors.elasticity = CGFloat(elasticity)
        squareBehaviors.density = CGFloat(density)
        squareBehaviors.resistance = CGFloat(resistance)
        squareBehaviors.friction = CGFloat(friction)
        print("square test")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
