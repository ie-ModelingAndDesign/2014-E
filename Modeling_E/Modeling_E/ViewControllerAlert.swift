//
//  ViewControllerAlert.swift
//  Modeling_E
//
//  Created by Maeshiro Kentaro on 2014/12/11.
//  Copyright (c) 2014年 TeamE. All rights reserved.
//

import UIKit
var mySelectedDate: String = "0"

class ViewControllerAlert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func date(sender: UIDatePicker){
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "HH:mm"
        mySelectedDate = myDateFormatter.stringFromDate(sender.date)
    }
    
    @IBOutlet weak var setTimeButton: UIButton!
    @IBAction func setTimeButton(sender: AnyObject) {
        timeLabel.text = "設定した時間は\n\(mySelectedDate)だね！"
        timeLabel.numberOfLines = 2
    }
    
    func format(date : NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "HH:mm"
        return  dateFormatter.stringFromDate(date)
    }
    
//    func alarm() {
//        if format(NSData()) == StringLiteralType(mySelectedDate) {
//            timeLabel.text = "おきてー！"
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
