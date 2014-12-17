//
//  ViewControllerAlert.swift
//  Modeling_E
//
//  Created by Maeshiro Kentaro on 2014/12/11.
//  Copyright (c) 2014年 TeamE. All rights reserved.
//

import UIKit

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
        var mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        timeLabel.text = "設定した時間は\n\(mySelectedDate)だね！"
        timeLabel.numberOfLines = 2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
