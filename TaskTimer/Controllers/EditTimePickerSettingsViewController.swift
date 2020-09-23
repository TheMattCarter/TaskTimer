//
//  ViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/23/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class EditTimePickerSettingsViewController: UIViewController {
    

    var settingTitles = ["Default Quick Timer", "Adjustment Increments", "Countdown Timer Duration", "Total Work Intervals", "Work Interval Length", "Break Interval Length"]
    var settingDescriptions = ["Select default timer mode for quick timer.", "Select increments used to adjust timer settings.", "Select default countdown timer duration.", "Select default number of work intervals for interval timer.", "Select default work interval duration for interval mode.", "Select default break interval duration for interval mode."]
    var myIndex = 0
   // var defaultPickerData: [Any] = [Any]() //need this
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingDescription: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var defaultTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTitle.text = settingTitles[myIndex]
        settingDescription.text = settingDescriptions[myIndex]
        
//        switch myIndex {
//        case 2:
//
//            ;
//        case 4:
//
//            ;
//        case 5:
//
//            ;
//        default:
//            print("error indexing setting")
//        }
        
        
    }
    

}
