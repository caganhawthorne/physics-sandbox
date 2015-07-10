//
//  ViewController.swift
//  Physics Sandbox
//
//  Created by caganhawthorne on 7/10/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var optionsView: UIView!
    
    
    @IBOutlet weak var buildView: UIView!
    
    @IBOutlet weak var masterBall: UIView!
    @IBOutlet weak var masterBrick: UIView!
    @IBOutlet weak var masterSquare: UIView!
    
    var itemsArray : [UIView] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        masterBall.backgroundColor = UIColor.purpleColor()
        masterBall.layer.cornerRadius = 10
        masterBall.clipsToBounds = true
        
        masterBrick.backgroundColor = UIColor.redColor()
        masterSquare.backgroundColor = UIColor.blueColor()


    }
    
    
    @IBAction func onObjectDragged(sender: UIPanGestureRecognizer) {
        let panGesture = sender.locationInView(buildView)

        if CGRectContainsPoint(masterBall.frame, sender.locationInView(optionsView)) {
            while(sender.state != UIGestureRecognizerState.Ended) {
                masterBall.center = CGPointMake(panGesture.x, panGesture.y)
            }
            //masterBall.center =
            let ball = Ball(x: panGesture.x, y: panGesture.y)
            itemsArray.append(ball)
            buildView.addSubview(ball)
            
        }
    }
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! PlayModeViewController
        //dvc.
    }


}

