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
    

    
    var elasticity = 1.0
    var density = 5
    var resistance = 5
    var friction = 1
    
    override
    init(x: CGFloat, y: CGFloat)
    {
        super.init(x: x, y: y)
        self.backgroundColor = UIColor.redColor()
        //self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
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