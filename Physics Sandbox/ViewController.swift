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
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        masterBall.backgroundColor = UIColor.purpleColor()
        masterBall.layer.cornerRadius = 10
        masterBall.clipsToBounds = true
        
        masterSquare.backgroundColor = UIColor.blueColor()


    }
    
    

    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let dvc = segue.destinationViewController as! PlayModeViewController
    //}


}

