//
//  TimerViewController.swift
//  TaskTimer
//
//  Created by Matthew Carter on 9/19/20.
//  Copyright © 2020 Matthew Carter. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var lapsedTimeLabel: UILabel!
    var timer = Timer()
    var initialTime = 0
    var secondsPassed = 0
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countUp()
        // Do any additional setup after loading the view.
    }
    
    func countUp() {
        timer.invalidate()
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLapsedTime), userInfo: nil, repeats: true)
        
    }

    func countDown() {
        
    }
    
    @objc func updateLapsedTime() {
        secondsPassed += 1
        print(secondsPassed)
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.unitsStyle = .positional
        timeFormatter.zeroFormattingBehavior = .pad
        
        let formattedTimeValue = timeFormatter.string(from: TimeInterval(secondsPassed))
        timeLabel.text = formattedTimeValue
    }
}
