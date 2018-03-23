//
//  ViewController.swift
//  HealthSense
//
//  Created by Adarsh Kulkarni on 3/23/18.
//  Copyright © 2018 Healthsense. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ESTTriggerManagerDelegate  {

    // 2. Add the trigger manager
    let triggerManager = ESTTriggerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 3. Set the trigger manager's delegate
        self.triggerManager.delegate = self
        
        // add this below:
        let rule1 = ESTOrientationRule.orientationEquals(
            .horizontalUpsideDown, for: .door)
        let rule2 = ESTMotionRule.motionStateEquals(
            true, forNearableIdentifier: "7d516d6786eadf98")
        let trigger = ESTTrigger(rules: [rule1, rule2], identifier: "tom the trigger")
        
        self.triggerManager.startMonitoring(for: trigger)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func triggerManager(_ manager: ESTTriggerManager,
                        triggerChangedState trigger: ESTTrigger) {
        if (trigger.identifier == "tom the trigger" && trigger.state == true) {
            print("Hello, digital world! The physical world has spoken.")
        } else {
            print("Goodnight. <spoken in the voice of a turret from Portal>")
        }
    }


}

