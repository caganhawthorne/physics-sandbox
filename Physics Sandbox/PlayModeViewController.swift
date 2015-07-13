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
            dynamicAnimator.addBehavior(index.dynamicBehavior)


        }
        
        collisionBehavior = UICollisionBehavior(items: allObjects)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        for index in allObjects {
            collisionBehavior.addItem(index)
        }

        gravity = UIGravityBehavior(items: allObjects)
        
        dynamicAnimator.addBehavior(gravity)
        
        print("\(allObjects.count)")
       
    }
    @IBAction func onStuffBeingDragged(sender: UIPanGestureRecognizer) {
        
    }
}
