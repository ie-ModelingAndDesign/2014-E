//
//  ViewController.swift
//  Modeling_E
//
//  Created by Maeshiro Kentaro on 2014/11/24.
//  Copyright (c) 2014年 TeamE. All rights reserved.
//

import UIKit

let imgList: [String] = ["test1","test2","test3"]
var flag: Int = 0
var img: String = imgList[flag]

class ViewController: UIViewController {
    
    @IBOutlet weak var gif: UIWebView!
    
    var targetURL = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL() {
        var requestURL = NSURL(string: targetURL!)
        var req = NSURLRequest(URL: requestURL!)
        gif.loadRequest(req)
        gif.scalesPageToFit = true
    }
    
    @IBAction func imgset(sender: UIButton) {
        flag++
        img  = imgList[flag%3]
        targetURL = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
        loadAddressURL()
        println("result:\(img)")
    }
    
    
}
