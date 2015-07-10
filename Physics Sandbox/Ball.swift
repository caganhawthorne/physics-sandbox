//
//  Ball.swift
//  Physics Sandbox
//
//  Created by caganhawthorne on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class Ball: UIView {
    
    var ballDynamicBehavior = UIDynamicItemBehavior()
    
    var elasticity = 1.0
    var density = 1
    var resistance = 1
    var friction = 0.1
    
    init(x: CGFloat, y: CGFloat)
    {
        super.init(frame: CGRectMake(x, y, 20, 20))
        self.backgroundColor = UIColor.purpleColor()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [self])
        
        ballDynamicBehavior.friction = CGFloat(friction)
        ballDynamicBehavior.resistance = CGFloat(resistance)
        ballDynamicBehavior.elasticity = CGFloat(elasticity)
        ballDynamicBehavior.density = CGFloat(density)
        ballDynamicBehavior.allowsRotation = false
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
        
    }
    


}
