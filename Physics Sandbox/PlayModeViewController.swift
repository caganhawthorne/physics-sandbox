//
//  PlayModeViewController.swift
//  Physics Sandbox
//
//  Created by caganhawthorne on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit
import CoreMotion

class PlayModeViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var dynamicAnimator = UIDynamicAnimator()
    var allObjects : [Item] = []
    var dynObjects : [UIDynamicItem] = []
    var collisionBehavior = UICollisionBehavior()
    var motionManager = CMMotionManager()
    var gravity : UIGravityBehavior!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        for index in allObjects {
            dynObjects.append(index)
            view.addSubview(index)

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
        /*
        let pushBehavior = UIPushBehavior(items: allObjects, mode: UIPushBehaviorMode.Continuous)
        pushBehavior.pushDirection = CGVectorMake(0, 4.71238898038)
        pushBehavior.magnitude = 5
        dynamicAnimator.addBehavior(pushBehavior)
        */
    
        
        print("\(allObjects.count)")
        
        //motionManager.startAccelerometerUpdatesToQueue(<#T##queue: NSOperationQueue##NSOperationQueue#>, withHandler: gravityUpdated(CMDeviceMotion, error: NSError.self))
       
    }
    @IBAction func onStuffBeingDragged(sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(sender.view!)
        let translation = sender.translationInView(self.view!)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view!)
    }
    
    func gravityUpdated(motion: CMDeviceMotion!, error: NSError!) {
        if (error != nil) {
            NSLog("\(error)")
        }
        
        let grav : CMAcceleration = motion.gravity;
        
        let x = CGFloat(grav.x);
        let y = CGFloat(grav.y);
        var p = CGPointMake(x,y)
        
        // Have to correct for orientation.
        var orientation = UIApplication.sharedApplication().statusBarOrientation;
        
        if orientation == UIInterfaceOrientation.LandscapeLeft {
            var t = p.x
            p.x = 0 - p.y
            p.y = t
        } else if orientation == UIInterfaceOrientation.LandscapeRight {
            var t = p.x
            p.x = p.y
            p.y = 0 - t
        } else if orientation == UIInterfaceOrientation.PortraitUpsideDown {
            p.x *= -1
            p.y *= -1
        }
        
        var v = CGVectorMake(p.x, 0 - p.y);
        gravity.gravityDirection = v;
    }

}
