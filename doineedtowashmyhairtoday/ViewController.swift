//
//  ViewController.swift
//  washhair?
//
//  Created by Zhuo Li on 10/31/16.
//  Copyright © 2016 Zhuo Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let washHairStartingDate = "2016-10-31"
    
    @IBOutlet weak var TellMeWashHairOrNot: UIButton!
    @IBOutlet weak var washHairResult: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func daysBetweenDates(startDate: NSDate, endDate: NSDate) -> Int
    {
        let calendar = NSCalendar.current as NSCalendar
        
        // Replace the hour (time) of both dates with 00:00
        let start = calendar.startOfDay(for: startDate as Date)
        let end = calendar.startOfDay(for: endDate as Date)
        
        let flags = NSCalendar.Unit.day
        let components = calendar.components(flags, from: start, to: end, options: [])
        
        return components.day!
    }

    @IBAction func TellMeWashHairOrNot(_ sender: AnyObject) {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date as Date)
        currentDate.text = dateString
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: washHairStartingDate)!
        
        let daysDiff = daysBetweenDates(startDate: startDate as NSDate, endDate: Date() as NSDate)
        if(daysDiff % 2 == 0){
            washHairResult.text = "Wash Hair Today"
        }
        else{
            washHairResult.text = "Wash Hair Tomorrow"
        }
    }
}

