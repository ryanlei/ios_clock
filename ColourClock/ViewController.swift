//
//  ViewController.swift
//  ColourClock
//
//  Created by Ryan Lei on 9/16/15.
//  Copyright © 2015 Ryan Lei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    let calendar = NSCalendar.currentCalendar()
    let flags = NSCalendarUnit.Hour.union(.Minute).union(.Second)
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: "updateTime:",
            userInfo: nil,
            repeats: true)
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_GB")
        dateFormatter.dateStyle = .NoStyle
        dateFormatter.timeStyle = .MediumStyle
    }
    
    func updateTime(timer: NSTimer) {
        let date = NSDate()
        timeLabel.text = dateFormatter.stringFromDate(date)
        
        let components = calendar.components(flags, fromDate: date)
        
        let hour = CGFloat(components.hour)
        let minute = CGFloat(components.minute)
        let second = CGFloat(components.second)
        
        let color = UIColor(red: hour/24, green: minute/60, blue: second/60, alpha: 1)
        
        UIView.animateWithDuration(1){() -> Void in self.view.backgroundColor = color}
        
    }

}

