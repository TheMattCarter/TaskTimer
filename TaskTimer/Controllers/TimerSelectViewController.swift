//
//  TimerSelectViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class TimerSelectViewController: UIViewController {

    
    @IBOutlet weak var basicCountDownTime: UIDatePicker!
    @IBOutlet weak var workCountDownTime: UIDatePicker!
    @IBOutlet weak var breakCountDownTime: UIDatePicker!
    @IBOutlet weak var qtyIntervalsLabel: UILabel!
    @IBOutlet weak var qtyIntevalsStepper: UIStepper!
    var initialTimeSelected = 0
    var breakTimeSelected = 0
    @IBOutlet weak var intervalLabel: UILabel!
    var qtyIntervalsSelected = 4
    var timerModeSelected = 0
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        
//        basicCountDownTime.countDownDuration = 1800
//            workCountDownTime.countDownDuration = 1500
//            breakCountDownTime.countDownDuration = 300
//            qtyIntervalsLabel.text = "(4)"
//            qtyIntervalsSelected = 4
//
            
            //update with settings
            let defaultIncrementsPref = defaults.integer(forKey: "defaultIncrements") ?? 1800
            let defaultCountDownPref = defaults.object(forKey: "defaultCountDownTimeDuration")
            let defaultQtyIntervalsPref = defaults.integer(forKey: "defaultQtyIntervals")
            let defaultWorkTimePref = defaults.object(forKey: "defaultWorkTimeDuration")
            let defaultBreakTimePref = defaults.object(forKey: "defaultBreakTimeDuration")
            
            
            basicCountDownTime.minuteInterval = defaultIncrementsPref
            workCountDownTime.minuteInterval = defaultIncrementsPref
            breakCountDownTime.minuteInterval = defaultIncrementsPref
            
            basicCountDownTime.countDownDuration = defaultCountDownPref as? TimeInterval ?? 1800
            workCountDownTime.countDownDuration = defaultWorkTimePref as? TimeInterval ?? 1500
            breakCountDownTime.countDownDuration = defaultBreakTimePref as? TimeInterval ?? 300
            
            
            qtyIntervalsSelected
                = defaultQtyIntervalsPref
            intervalLabel.text = "(\(String(format: "%.0f", qtyIntervalsSelected)))"
        
            
          
    //        if defaultIncrementsPref != nil {
    //            basicCountDownTime.minuteInterval = defaultIncrementsPref
    //            workCountDownTime.minuteInterval = defaultIncrementsPref
    //            breakCountDownTime.minuteInterval = defaultIncrementsPref
    //        }
    
    }
        
    @IBAction func updateIntervalLabel(_ sender: Any) {
        intervalLabel.text = "(\(String(format: "%.0f", qtyIntevalsStepper.value)))"
    }
    
   
    
    @IBAction func startCountDown(_ sender: UIDatePicker) {
        initialTimeSelected = Int(basicCountDownTime.countDownDuration)
       breakTimeSelected = 0
       qtyIntervalsSelected = 0
        timerModeSelected = 2
        
        goToTimer()
    }
    
    @IBAction func startIntervals(_ sender: Any) {
        initialTimeSelected = Int(workCountDownTime.countDownDuration)
        breakTimeSelected = Int(breakCountDownTime.countDownDuration)
        qtyIntervalsSelected = Int(qtyIntevalsStepper.value)
        timerModeSelected = 1
        
        goToTimer()
    }
    
    @IBAction func startRunningTime(_ sender: Any) {
        initialTimeSelected = 0
        breakTimeSelected = 0
        qtyIntervalsSelected = 0
        timerModeSelected = 0
        
        goToTimer()
    }
    
    func goToTimer() {
        
        print(initialTimeSelected)
        
        performSegue(withIdentifier: "goToTimer", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TimerViewController
        
        destinationVC.timerCurrentTime = self.initialTimeSelected
        destinationVC.workTime = self.initialTimeSelected
        destinationVC.breakTime = self.breakTimeSelected
        destinationVC.qtyIntervals = self.qtyIntervalsSelected
        destinationVC.timerMode = self.timerModeSelected
        
    }
    
}
