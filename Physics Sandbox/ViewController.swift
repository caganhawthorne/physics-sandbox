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
    
    var ballSelected = false
    var brickSelected = false
    var squareSelected = false
    
    var itemsArray : [UIView] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        masterBall.backgroundColor = UIColor.purpleColor()
        masterBall.layer.cornerRadius = 10
        masterBall.clipsToBounds = true
        
        masterBrick.backgroundColor = UIColor.redColor()
        masterSquare.backgroundColor = UIColor.blueColor()


    }
    
    
    @IBAction func screenIsTapped(sender: UITapGestureRecognizer) {
    

    if CGRectContainsPoint(masterBall.frame, sender.locationInView(optionsView)) {
        if masterBall.backgroundColor == UIColor.purpleColor() {
            masterBall.backgroundColor = UIColor.yellowColor()
            ballSelected = true
        }
        else{
            masterBall.backgroundColor = UIColor.purpleColor()
            ballSelected = false
        }
        
    }
        if CGRectContainsPoint(buildView.frame, sender.locationInView(view)) {
            let tapGesture = sender.locationInView(view)

            if ballSelected {
                let ball = Ball(x: tapGesture.x, y: tapGesture.y)
                view.addSubview(ball)
                itemsArray.append(ball)
            }
            else if brickSelected {
                let brick = Brick(x: tapGesture.x, y: tapGesture.y)
                view.addSubview(brick)
                itemsArray.append(brick)
            }
            else if squareSelected {
                let square = Square(x: tapGesture.x, y: tapGesture.y)
                view.addSubview(square)
                itemsArray.append(square)
            }
        }
    }
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! PlayModeViewController
        dvc.allObjects = itemsArray
    }


}

