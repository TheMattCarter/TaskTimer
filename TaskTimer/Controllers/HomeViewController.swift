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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //marking first launch / subsequent launches
        if defaults.bool(forKey: "First Launch") == true {
            
            
            
            print(">= 2nd Use")
            
            defaults.set(true, forKey: "First Launch")
            
        } else {
            
        //marks first use
        print("1st Use")
            
            
            
        }
        
        
    }


}

