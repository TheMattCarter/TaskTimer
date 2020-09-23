//
//  SettingsTableViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/22/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var selectedIndex = 0
    
    @IBOutlet weak var doNotDisturbSwitch: UISwitch!
    @IBOutlet weak var soundNotificationSwitch: UISwitch!
    @IBOutlet weak var pushNotificationSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    
        if doNotDisturbSwitch.isOn {
            defaults.set(true, forKey: "doNotDisturb")
        } else {
            defaults.set(false, forKey: "doNotDisturb")
        }
    
        if soundNotificationSwitch.isOn{
            defaults.set(true, forKey: "soundNotifications")
        } else {
            defaults.set(false, forKey: "soundNotifications")
        }
        
        if pushNotificationSwitch.isOn{
            defaults.set(true, forKey: "pushNotifications")
        } else {
            defaults.set(false, forKey: "pushNotifications")
        }
                           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editStringPickerSetting" {
            let destinationVC1 = segue.destination as! EditStringPickerSettingsViewController
            destinationVC1.myIndex = self.selectedIndex
            
        } else if segue.identifier == "editTimePickerSetting" {
            let destinationVC2 = segue.destination as! EditTimePickerSettingsViewController
            destinationVC2.myIndex=self.selectedIndex
            
        } else if segue.identifier == "editIntPickerSetting" {
        let destinationVC3 = segue.destination as! EditIntPickerSettingsViewController
        destinationVC3.myIndex=self.selectedIndex

            
        } else {
            print ("error performing segue")
        }
        
        
        
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let destinationVC2 = segue.destination as! EditTimePickerViewController
    //        destinationVC2.myIndex=self.selectedIndex
    //    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        print(selectedIndex)
        
        switch selectedIndex {
        case 0: performSegue(withIdentifier: "editStringPickerSetting", sender: self);
        case 1: performSegue(withIdentifier: "editIntPickerSetting", sender: self);
        case 2: performSegue(withIdentifier: "editTimePickerSetting", sender: self);
        case 3: performSegue(withIdentifier: "editIntPickerSetting", sender: self);
        case 4: performSegue(withIdentifier: "editTimePickerSetting", sender: self);
        case 5: performSegue(withIdentifier: "editTimePickerSetting", sender: self)
        default: print("error")
        }
        
        
    }
    
    
 
    
}
