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
        
        let pushBehavior = UIPushBehavior(items: allObjects, mode: UIPushBehaviorMode.Continuous)
        pushBehavior.pushDirection = CGVectorMake(0, 4.71238898038)
        pushBehavior.magnitude = 5
        dynamicAnimator.addBehavior(pushBehavior)
        
        
        print("\(allObjects.count)")
       
    }
    var item : Item!

    @IBAction func onStuffBeingDragged(sender: UIPanGestureRecognizer) {
        
        
        if (sender.state == UIGestureRecognizerState.Began) {
            
            for i in allObjects {
                if CGRectContainsPoint(i.frame, sender.locationInView(view)) {
                item = i
                }
            }
        }
        

            if let a = item {
                let panGesture = sender.locationInView(view)
                a.center = CGPointMake(panGesture.x, panGesture.y)
                dynamicAnimator.updateItemUsingCurrentState(a)
            }

        }
    }


