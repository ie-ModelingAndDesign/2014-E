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
let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //時刻評価を30秒ごとに
        NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("alarm"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セリフラベル
    @IBOutlet weak var timeLabel: UILabel!
    
    //設定した時間の取得
    @IBAction func date(sender: UIDatePicker){
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "HH:mm"
        mySelectedDate = myDateFormatter.stringFromDate(sender.date)
    }
    
    //時間設定buttonと押した時のアクション
    @IBOutlet weak var setTimeButton: UIButton!
    @IBAction func setTimeButton(sender: AnyObject) {
        timeLabel.text = "設定した時間は\n\(mySelectedDate)だね！"
        timeLabel.numberOfLines = 2
    }
    
    //現在時刻取得メソッド
    func format(date : NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "HH:mm"
        return  dateFormatter.stringFromDate(date)
    }
    
    //設定時刻になった時の動作
    func alarm() {
        let now = NSDate()
            if(format(now) == mySelectedDate as NSString){
               timeLabel.text = "時間だよ！おきてー！"
            }
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
