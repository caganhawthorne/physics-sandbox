//
//  PlayModeViewController.swift
//  Physics Sandbox
//
//  Created by caganhawthorne on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class PlayModeViewController: UIViewController {
    
    var dynamicAnimator = UIDynamicAnimator()
    var allObjects : [Item] = []
    var gravity : UIGravityBehavior!
    var dynObjects : [UIDynamicItem] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gravity = UIGravityBehavior(items: allObjects)
        dynamicAnimator.addBehavior(gravity)
        for index in allObjects {
            dynObjects.append(index)
            view.addSubview(index)

        }

        
        
        print("\(allObjects.count)")
        for index in allObjects{
        dynamicAnimator.addBehavior(index.dynamicBehavior)
        }

    }



}
