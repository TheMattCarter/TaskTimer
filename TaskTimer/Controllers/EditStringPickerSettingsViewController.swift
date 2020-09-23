//
//  SettingsViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class EditStringPickerSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var settingTitles = ["Default Quick Timer", "Adjustment Increments", "Countdown Timer Duration", "Total Work Intervals", "Work Interval Length", "Break Interval Length"]
    var settingDescriptions = ["Select default timer mode for quick timer.", "Select increments used to adjust timer settings.", "Select default countdown timer duration.", "Select default number of work intervals for interval timer.", "Select default work interval duration for interval mode.", "Select default break interval duration for interval mode."]
    var myIndex = 0
    var defaultPickerData: [String] = [String]()
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingDescription: UILabel!
    
    let defaults = UserDefaults.standard
    
//    @IBOutlet weak var doNotDisturbToggle: UISwitch!
//    @IBOutlet weak var soundNotificationsToggle: UISwitch!
//    @IBOutlet weak var pushNotificationsToggle: UISwitch!

    @IBOutlet weak var defaultPicker: UIPickerView!
    
//    var defaultTimerPickerData: [String] = [String]()
//    @IBOutlet weak var timeIncrementPicker: UIPickerView!
//    var timeIncrementPickerData: [String] = [String]()
//    @IBOutlet weak var countdownDurationPicker: UIDatePicker!
//    @IBOutlet weak var workIntDurationPicker: UIDatePicker!
//    @IBOutlet weak var breakIntDurationPicker: UIDatePicker!
//    @IBOutlet weak var workIntQtyStepper: UIStepper!
//    @IBOutlet weak var workIntQtyTextField: UITextField!
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTitle.text = settingTitles[myIndex]
        settingDescription.text = settingDescriptions[myIndex]
        
        defaultPicker.delegate = self
        defaultPicker.dataSource = self
        
        
       
    defaultPickerData.append(contentsOf: ["Countdown", "Interval", "Running Time"])
         
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    

//    @IBAction func saveButtonPressed(_ sender: Any) {
    
//        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
//        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
//        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
//        defaults.set(defaultTimerPicker.selectedRow(inComponent: 1), forKey: "defaultTimerMode")
//        defaults.set(timeIncrementPicker.selectedRow(inComponent: 1), forKey: "defaultAdjustmentIncrements")
//        defaults.set(countdownDurationPicker.countDownDuration, forKey: "defaultCountdownDuration")
//        //defaults.set(<#T##value: Int##Int#>, forKey: <#T##String#>)
//        defaults.set(workIntDurationPicker.countDownDuration, forKey: "defaultWorkIntDuration")
//        defaults.set(breakIntDurationPicker.countDownDuration, forKey: "defaultbreakIntDuration")
//
//    }
   
    
    
   //MARK: - Picker Setup Delegate Methods
//
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        //update defaults...necessary?
    }
//
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return 3

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return defaultPickerData[row]
        
    }

}
