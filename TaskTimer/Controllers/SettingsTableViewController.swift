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
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
