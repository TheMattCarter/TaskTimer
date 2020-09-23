//
//  ViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let defaults = UserDefaults.standard
//    var timerModeSelected = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //marking first launch / subsequent launches
        if defaults.bool(forKey: "First Launch") == true {
            
            
            
            print(">= 2nd Use")
            
            defaults.set(true, forKey: "First Launch")
            
        } else {
            
            
        //marks first use
        print("1st Use")
        
        //setting default preferences
            defaults.set(5, forKey: "defaultIncrements")
            defaults.set(1800,forKey:  "defaultCountDownTimeDuration")
             defaults.set(4, forKey: "defaultQtyIntervals") //should be good
            defaults.set(1500, forKey: "defaultWorkTimeDuration")
            defaults.set(300, forKey: "defaultBreakTimeDuration")
            defaults.set(true, forKey: "doNotDisturb")
            defaults.set(true, forKey: "soundNotifications")
            defaults.set(true, forKey: "pushNotifications")
            defaults.set("Running Time", forKey: "defaultQuickTimerMode")
            
            
            
        }
        
       
        
    }
    
    
    
}

