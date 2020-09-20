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
    var selectedInitialTime = 0
    var restTime = 0
    @IBOutlet weak var intervalLabel: UILabel!
    var qtyIntervals = 4
    var mode = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicCountDownTime.minuteInterval = 5
        workCountDownTime.minuteInterval = 1
        breakCountDownTime.minuteInterval = 1
        
    }
    

    @IBAction func updateIntervalLabel(_ sender: Any) {
        intervalLabel.text = "(\(String(format: "%.0f", qtyIntevalsStepper.value)))"
    }
    
    //String(format: “%.2f”, inputValue)
    
    @IBAction func startCountDown(_ sender: UIDatePicker) {
        selectedInitialTime = Int(basicCountDownTime.countDownDuration)
       restTime = 0
       qtyIntervals = 0
        mode = 2
        
        goToTimer()
    }
    
    @IBAction func startIntervals(_ sender: Any) {
        selectedInitialTime = Int(workCountDownTime.countDownDuration)
        restTime = Int(breakCountDownTime.countDownDuration)
        qtyIntervals = Int(qtyIntevalsStepper.value)
        mode = 1
        
        goToTimer()
    }
    
    @IBAction func startRunningTime(_ sender: Any) {
        selectedInitialTime = 0
        restTime = 0
        qtyIntervals = 0
        mode = 0
        
        goToTimer()
    }
    
    func goToTimer() {
        
        print(selectedInitialTime)
        
        performSegue(withIdentifier: "goToTimer", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TimerViewController
        
        destinationVC.timerCurrentTime = self.selectedInitialTime
        destinationVC.timerRestTime = self.restTime
        destinationVC.timerQtyIntervals = self.qtyIntervals
        destinationVC.timerMode = self.mode
        
    }
    
}
