//
//  TimerViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var timerMode = 0
    
    var timer = Timer()
    var timerCurrentTime = 0
    
    
    var workTime = 0
    var workTimeLapsed = 0
    
    var breakTime = 0
    var breakTimeLapsed = 0
    
    var qtyIntervals = 0
    var qtyWorkIntervalsCompleted = 0
    var qtyBreakIntervalsCompleted = 0
    
    //total progress
    var totalSecondsLapsedWorking = 0
    var totalSecondsLapsedResting = 0
    
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(timerCurrentTime)
        progressLabel.isHidden = true
        
        switch timerMode{
        case 0: startRunningTime()
        case 1: startIntervals()
        case 2: startCountDown()
        default: print("error selecting timer mode")
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    
    func startCountDown() {
        print ("countdown")
        modeLabel?.text = "insert inspirational quote here"
        timer.invalidate()
        totalSecondsLapsedWorking = 0
        
        //        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(descendingTimer), userInfo: nil, repeats: true)
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.totalSecondsLapsedWorking += 1
            self.timerCurrentTime -= 1
            print (self.timerCurrentTime)
            self.updateTimeLabel(timerLabelSeconds: self.timerCurrentTime)
            
            if self.timerCurrentTime == 0 {
                timer.invalidate()
                print("done")
                self.modeLabel?.text = "done"
                
                //play sound
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
    }
    
    func startIntervals() {
        
        // interval progress label setup. may need a compute progress function
        progressLabel.isHidden = false
        
        
        let totalRunTime = qtyIntervals * (workTime + breakTime)
        let workTimeSelected = workTime
        var wtProgress = workTimeLapsed
        let breakTimeSelected = breakTime
        var btProgress = breakTimeLapsed
        
        print("\(qtyIntervals) intervals")
        print("total run time is \(totalRunTime) seconds")
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            //update progress label
            if self.qtyWorkIntervalsCompleted == 0 {
                self.progressLabel.text = "1 / \(self.qtyIntervals)"}
            else {
            self.progressLabel.text = "\(self.qtyWorkIntervalsCompleted) / \(self.qtyIntervals)"
            }
            
            //if all intervals done
            if self.qtyWorkIntervalsCompleted == self.qtyIntervals  {
                timer.invalidate()
                print("done")
                self.modeLabel?.text = "done"
                
            }
            
            //for work int
            else if self.qtyWorkIntervalsCompleted == self.qtyBreakIntervalsCompleted {
                
                btProgress = 0
                self.breakTime = breakTimeSelected
                
                //work label
                self.modeLabel.text = "work"
                
                //update time
                self.workTime -= 1
                self.updateTimeLabel(timerLabelSeconds: self.workTime)
                self.workTimeLapsed += 1
                wtProgress += 1
                print("\(self.workTime) seconds work remaining")
                
                //marking end of work interval
                if wtProgress == workTimeSelected {
                    self.qtyWorkIntervalsCompleted += 1
                    print("\(self.qtyWorkIntervalsCompleted) work intervals completed")
                    self.totalSecondsLapsedWorking = self.workTimeLapsed
                    print("\(self.totalSecondsLapsedWorking) seconds of total work")
                    
                    //play sound
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    self.player = try! AVAudioPlayer(contentsOf: url!)
                    self.player.play()
                    
                }
                
            }
            
            //for break int
            else if self.qtyWorkIntervalsCompleted > self.qtyBreakIntervalsCompleted {
                
                //refresh work interval
                wtProgress = 0
                self.workTime = workTimeSelected
                
                //break label
                self.modeLabel.text = "break"
                
                //update time
                self.breakTime -= 1
                self.updateTimeLabel(timerLabelSeconds: self.breakTime)
                self.breakTimeLapsed += 1
                btProgress += 1
                print("\(self.breakTime) seconds remaining in break")
                
                //marking end of break period
                if btProgress == breakTimeSelected {
                    self.qtyBreakIntervalsCompleted += 1
                    print("\(self.qtyBreakIntervalsCompleted) break intervals completed")
                    self.totalSecondsLapsedResting = self.breakTimeLapsed
                    print("\(self.totalSecondsLapsedResting) seconds of total break time")
                    
                    //play sound
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    self.player = try! AVAudioPlayer(contentsOf: url!)
                    self.player.play()
                    
                }
            }
            else {
                print ("error retrieving interval status")
            }
        }
    }
    
    func startRunningTime() {
        print("running time")
        modeLabel?.text = "insert another inspirational quote here"
        timer.invalidate()
        totalSecondsLapsedWorking = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.totalSecondsLapsedWorking += 1
            self.timerCurrentTime += 1
            print(self.timerCurrentTime)
            self.updateTimeLabel(timerLabelSeconds: self.timerCurrentTime)
            
        }
        
    }
    
    //    @objc func descendingTimer() {
    //        totalSecondsLapsedWorking += 1
    //        timerCurrentTime -= 1
    //        print (timerCurrentTime)
    //        updateTimeLabel(timerLabelSeconds: timerCurrentTime)
    //    }
    
    //    @objc func ascendingTimer() {
    //           totalSecondsLapsedWorking += 1
    //           timerCurrentTime += 1
    //           print(timerCurrentTime)
    //        updateTimeLabel(timerLabelSeconds: timerCurrentTime)
    //       }
    
    
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
        print(totalSecondsLapsedWorking)
        timer.invalidate()
    }
}
