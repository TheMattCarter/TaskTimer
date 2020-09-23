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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    //        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
            //        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
            //        defaults.set(<#T##value: Bool##Bool#>, forKey: <#T##String#>)
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
