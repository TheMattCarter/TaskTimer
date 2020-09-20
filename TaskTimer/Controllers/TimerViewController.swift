//
//  TimerViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    
    var timer = Timer()
    var timerCurrentTime = 0
    var timerRestTime = 0
    var timerQtyIntervals = 0
    var timerMode = 0
    var secondsLapsedWorking = 0
    var secondsLapsedResting = 0
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(timerCurrentTime)
        
        switch timerMode{
        case 0: startRunningTime()
        case 1: startIntervals()
        case 2: startCountDown()
        default: print("error selecting timer mode")
        }
        
    }

    func startCountDown() {
        print ("countdown")
        modeLabel?.text = "insert inspirational quote here"
        timer.invalidate()
        secondsLapsedWorking = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(descendingTimer), userInfo: nil, repeats: true)
        
    }
    
    func startIntervals() {
        let intervalsToExecute = timerQtyIntervals
        let selectedWorkTime = timerCurrentTime
        
        print("interval")
                
        for i in 0..<(2 * timerQtyIntervals){
            
            if timerCurrentTime > 0 {
                
                print("period \((i/2) + 1) of \(intervalsToExecute)")
                
                timer.invalidate()
                print("work")
                modeLabel.text = "work"
                //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(descendingTimer), userInfo: nil, repeats: true)
                
                timerCurrentTime = 0
            } else {
                timer.invalidate()
                print("break")
                modeLabel.text = "break"
                //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(intBreakTimer), userInfo: nil, repeats: true)
                timerCurrentTime = selectedWorkTime
            }

        timerQtyIntervals -= 1
        }
        
    }
    
    func startRunningTime() {
           print("running time")
        modeLabel?.text = "insert another inspirational quote here"
           timer.invalidate()
           secondsLapsedWorking = 0
           
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ascendingTimer), userInfo: nil, repeats: true)
           
       }
    
    @objc func descendingTimer() {
        secondsLapsedWorking += 1
        timerCurrentTime -= 1
        print (timerCurrentTime)
        updateTimeLabel(timerLabelSeconds: timerCurrentTime)
    }
    
    @objc func ascendingTimer() {
           secondsLapsedWorking += 1
           timerCurrentTime += 1
           print(timerCurrentTime)
        updateTimeLabel(timerLabelSeconds: timerCurrentTime)
       }
    
    @objc func intBreakTimer() {
        secondsLapsedResting += 1
        timerRestTime -= 1
        print(timerRestTime)
        updateTimeLabel(timerLabelSeconds: timerRestTime)

    }
    
//    @objc func intTimer() {
//
//        let selectedWorkTime = timerCurrentTime
//
//        if timer.timeinterval < selectedWorkTime {
//            print("work")
//            modeLabel.text = "work"
//            secondsLapsedWorking += 1
//            timerCurrentTime -= 1
//            print(timerCurrentTime)
//            updateTimeLabel(timerLabelSeconds: timerCurrentTime)
//            // timerCurrentTime = 0
//
//        } else {
//            print("break")
//            modeLabel.text = "break"
//            secondsLapsedResting += 1
//            timerRestTime -= 1
//            print(timerRestTime)
//            updateTimeLabel(timerLabelSeconds: timerRestTime)
//            timerCurrentTime = selectedWorkTime
//        }
//
//    }

    
    
    func updateTimeLabel(timerLabelSeconds: Int) {

        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.unitsStyle = .positional
        timeFormatter.zeroFormattingBehavior = .pad

        let formattedTimeValue = timeFormatter.string(from: TimeInterval(timerLabelSeconds))
        
        timeLabel.text = formattedTimeValue
        
    }
    
    
    @IBAction func pausePressed(_ sender: Any) {
        stopTimer()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        stopTimer()
    }
    
    
    func stopTimer() {
        print(secondsLapsedWorking)
        timer.invalidate()
    }
}
