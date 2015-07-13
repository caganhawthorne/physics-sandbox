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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in allObjects {
        dynamicAnimator.addBehavior(index.dynamicBehavior)
        }
    }



}
