//
//  ViewController.swift
//  TodoApp
//
//  Created by Ibrahima Dansokho on 11/05/2017.
//  Copyright © 2017 ibra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
            if view.traitCollection.forceTouchCapability == .available {
                if touch.force == touch.maximumPossibleForce {
                    // user pressed hard – do something!
                    startBtn.setTitle("Force touch", for:.normal)
                }
            }
        }
    }

}

