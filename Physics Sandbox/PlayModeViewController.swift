//
//  PlayModeViewController.swift
//  Physics Sandbox
//
//  Created by caganhawthorne on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class PlayModeViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var dynamicAnimator = UIDynamicAnimator()
    var allObjects : [Item] = []
    var gravity : UIGravityBehavior!
    var dynObjects : [UIDynamicItem] = []
    var collisionBehavior = UICollisionBehavior()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        for index in allObjects {
            dynObjects.append(index)
            view.addSubview(index)

        }
        for i in allObjects{
            dynamicAnimator.addBehavior(i.dynamicBehavior)
        }

        
        
        let items : [UIView] = allObjects

        
        collisionBehavior = UICollisionBehavior(items: items)
        
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        
        dynamicAnimator.addBehavior(collisionBehavior)


        gravity = UIGravityBehavior(items: allObjects)
        gravity.removeItem(<#T##item: UIDynamicItem##UIDynamicItem#>)
        dynamicAnimator.addBehavior(gravity)
        
        print("\(allObjects.count)")
       
    }


    

}
