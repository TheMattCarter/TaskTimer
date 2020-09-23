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
//need this shit?
//    let defaultCountDownTimeSelected = 30
//    let defaultWorkTimeSelected = 25
//    let defaultBreakTimeSelected = 5
    
    @IBOutlet weak var defaultTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         defaultTimePicker.minuteInterval = defaults.integer(forKey: "defaultIncrements")
        
        if myIndex == 2 {
            defaultTimePicker.countDownDuration = 1800
        } else if myIndex == 4 {
            defaultTimePicker.countDownDuration = 1500
        } else if myIndex == 5 {
            defaultTimePicker.countDownDuration = 300
        }
        
        
        let defaultCountDownTimeSaved = defaults.object(forKey: "defaultCountDownTimeDuration")
        let defaultWorkTimeSaved = defaults.object(forKey: "defaultWorkTimeDuration")
        let defaultBreakTimeSaved = defaults.object(forKey: "defaultBreakTimeDuration")
        
        settingTitle.text = settingTitles[myIndex]
        settingDescription.text = settingDescriptions[myIndex]
        
        if myIndex == 2 {
            if defaultCountDownTimeSaved != nil {
                defaultTimePicker.countDownDuration = defaultCountDownTimeSaved as! TimeInterval
            } else if defaultCountDownTimeSaved == nil {
                defaultTimePicker.countDownDuration = 1800
            }
        } else if myIndex == 4 {
            if defaultWorkTimeSaved != nil {
                defaultTimePicker.countDownDuration = defaultWorkTimeSaved as! TimeInterval
            } else if defaultWorkTimeSaved == nil {
                defaultTimePicker.countDownDuration = 1500
            }
        } else if myIndex == 5 {
            if defaultBreakTimeSaved != nil {
                defaultTimePicker.countDownDuration = defaultBreakTimeSaved as! TimeInterval
            } else if defaultWorkTimeSaved == nil {
                defaultTimePicker.countDownDuration = 300
            }
           
        } else {
            print("error loading time duration setting options")
        }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if myIndex == 2 {
            defaults.set(defaultTimePicker.countDownDuration, forKey: "defaultCountDownTimeDuration")
            
            // defaults.set(userSelection, forKey: "defaultIncrements")
        } else if myIndex == 4 {
            defaults.set(defaultTimePicker.countDownDuration, forKey: "defaultWorkTimeDuration")
            
        } else if myIndex == 5 {
            defaults.set(defaultTimePicker.countDownDuration, forKey: "defaultBreakTimeDuration")
            
        }
    }
    

}
