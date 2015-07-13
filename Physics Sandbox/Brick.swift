//
//  Brick.swift
//  Physics Sandbox
//
//  Created by travis on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import Foundation
import UIKit

class Brick : Item {
    

    
    var elasticity = 2.0
    var density = 3
    var resistance = 0.5
    var friction = 0.5
    
    
    init(x: CGFloat, y: CGFloat)
    {
        super.init(x: x, y: y, h: 40, w: 20)
        self.backgroundColor = UIColor.redColor()
        
        var dynamicBehavior = UIDynamicItemBehavior(items: [self])
        
        dynamicBehavior = UIDynamicItemBehavior(items: [self])
        dynamicBehavior.friction = CGFloat(friction)
        dynamicBehavior.resistance = CGFloat(resistance)
        dynamicBehavior.elasticity = CGFloat(elasticity)
        dynamicBehavior.density = CGFloat(density)
        dynamicBehavior.allowsRotation = true
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}