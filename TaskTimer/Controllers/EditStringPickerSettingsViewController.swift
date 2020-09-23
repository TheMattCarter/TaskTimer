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
    var defaultPickerData = ["Countdown", "Interval", "Running Time"]
    var defaultModeSelected = ""
    
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingDescription: UILabel!
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var defaultPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultModeSaved = defaults.string(forKey: "defaultQuickTimerMode") ?? "Countdown"
        
        settingTitle.text = settingTitles[myIndex]
        settingDescription.text = settingDescriptions[myIndex]
        
        
        defaultPicker.delegate = self
        defaultPicker.dataSource = self
        
        //
        defaultPicker.selectRow(defaultPickerData.firstIndex(of: defaultModeSaved) ?? 0, inComponent: 0, animated: false)
        
       
         
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         
        defaults.set(defaultModeSelected, forKey: "defaultQuickTimerMode")
        print(defaultModeSelected)
    }
   
    
    
   //MARK: - Picker Setup Delegate Methods
//
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaultModeSelected = defaultPickerData[row]
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
