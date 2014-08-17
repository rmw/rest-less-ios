//
//  ViewController.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/15/14.
//  Copyright (c) 2014 newts. All rights reserved.
//


import UIKit

func secondsToDisplay(let seconds: NSTimeInterval) -> String{
    var time : NSTimeInterval = seconds
    let minutes = UInt8(time / 60.0)
    time -= (NSTimeInterval(minutes) * 60)

    let seconds = UInt8(time)
    time -= NSTimeInterval(seconds)

    let fraction = UInt8(time * 100)
    
    let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
    let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
    let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)

    return "\(strMinutes):\(strSeconds):\(strFraction)"
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var startTime = NSTimeInterval()
    var restTime:NSTimeInterval = 90
    var restTimeDate: NSDate!
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTimeLabel.text = secondsToDisplay(restTime)
        
        restTimeDate = NSDate(timeIntervalSinceNow: restTime)
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        if !timer.valid {
            //            startTime.advancedBy(2000)
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            
        }
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
         println(timer.timeInterval)
        timer.invalidate()
        HTTPostJSON("http://secret-stream-5880.herokuapp.com/exercises", [val])
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        timer.invalidate()
        
        displayTimeLabel.text = secondsToDisplay(restTime)
    }
    
    @IBAction func sendData(sender: AnyObject) {
        var params = ["workout_type":"weights"] as Dictionary
        
        HTTPostJSON("http://secret-stream-5880.herokuapp.com/exercises", params)
        
    }
    var val = 0.0
    func updateTime() {
         val += timer.timeInterval
        var elapsedTime: NSTimeInterval = restTimeDate.timeIntervalSinceNow

        displayTimeLabel.text = secondsToDisplay(elapsedTime)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

