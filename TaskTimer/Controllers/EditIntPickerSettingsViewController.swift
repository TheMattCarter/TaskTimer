//
//  EditIntSettingsViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/23/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class EditIntPickerSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var settingTitles = ["Default Quick Timer", "Adjustment Increments", "Countdown Timer Duration", "Total Work Intervals", "Work Interval Length", "Break Interval Length"]
       var settingDescriptions = ["Select default timer mode for quick timer.", "Select increments used to adjust timer settings.", "Select default countdown timer duration.", "Select default number of work intervals for interval timer.", "Select default work interval duration for interval mode.", "Select default break interval duration for interval mode."]
    var myIndex = 0
    var defaultPickerData: [Int] = [Int]()
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingDescription: UILabel!
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var defaultPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingTitle.text = settingTitles[myIndex]
        settingDescription.text = settingDescriptions[myIndex]
        
        defaultPicker.delegate = self
        defaultPicker.dataSource = self
        
        
        switch myIndex {
        case 1:
            defaultPickerData.append(contentsOf: [ 1, 2, 5, 10, 15, 20])
            ;
        case 3:
            defaultPickerData.append(contentsOf: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
            ;
        default:
            print("error indexing setting")
        }
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
           
       }
    
    
     //MARK: - Picker Setup Delegate Methods
    //
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        //update defaults...necessary?
        }
    //
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //
    //        if pickerView == defaultTimerPicker {
    //            return 1}
    //        else if pickerView == timeIncrementPicker {
    //            return 1
    //        }
            return 1
        }
    //
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
   
            return defaultPickerData.count
    
        }
    //
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //
    //        if myIndex == 0 {
            return String(defaultPickerData[row])
    //
    //    }
    //        else if pickerView == timeIncrementPicker {
    //            return timeIncrementPickerData[row]
    //        }
    //        return "error"
        }
    //
    //
        
    }

