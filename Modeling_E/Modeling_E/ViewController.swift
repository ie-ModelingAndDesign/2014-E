//
//  ViewController.swift
//  Modeling_E
//
//  Created by Maeshiro Kentaro on 2014/11/24.
//  Copyright (c) 2014年 TeamE. All rights reserved.
//

import UIKit

let imgList: [String] = ["smile2","angry2","ai2","zito2","odoroki2","test_s"]
let lastImgList: [String] = ["smile_last","angry_last","ai_last","zito_last","odoroki_last"]
var serif: [String] = ["課題終わった？","今日時間ある?","今日の課題出した？","調子どう？","ふわぁ〜","進捗どう？","どこ見てるの？","勉強進んでる？","どう？頑張ってる？","今度の休みの日に遊びに行かない？","教えて欲しい課題があるんだけど，大丈夫?"]
var serifAnswer: [[String]] = [["まだ","やったよ"],
                                ["あるよ","課題が忙しいから，無いかな","頑張って早く終わらせるね","遺書に勉強しよ"],
                                ["出したよ","まだ","わかった","課題見せて"],
                                ["バッチリ","まあまあ"],
                                ["眠いの？","お話しよ"],
                                ["ありません！","うーん進んでない","いい感じ！"],
                                ["じ〜〜","うん？なにか言った？"],
                                ["覚えるの多くてねー","進まないね〜","ちょっと休憩中","やってない"],
                                ["うん，やってるよ","う，うん，やってるやってる","課題なら終わったよ"],
                                ["忙しいからちょっとなーー","もう予定入ってるからいけないな","うん，行きたい",""],
                                ["教えられるかな","大丈夫だよ，どこ？","ここはこうしたら良いよ"]]
var serifResult: [[[String]]] = [[["あとで見せてって言っても見せてあげないよ","もー頑張ってよね","後で「教えて」って言ってもダメなんだからね"],["エライね！","すごい！","そうなの！？早いね！"]],
                                [["あれれ？課題はどうしたのかな？"],["ふーん．．．"],["じゃあ終わったら遊びに行こ"],["そ，そうだね！一緒に勉強しよ！"]],
                                [["さすが！エライね"],["もう，早く出しなさい！"],["じゃあ終わるまでまってるね"],["自分でやらないとダメなんだよ"]],
                                [["私もバッチリ！"],["そうなんだ．．．元気だして！"]],
                                [["遅くまで課題頑張ってたからね"],["・・・・眠いから後でね"]],
                                [["頑張ってよ！"],["行き詰まったら人に相談してみてもいいんじゃないかな"],["さすが！"]],
                                [["な，なによ"],["・・・もういいよ"]],
                                [["暗記は青色のペンで書くと覚えやすくなるらしいよ"],["そっか，じゃあ少し休んで気分転換でもしよ"],["休憩は大事だよね"],["ちょっと！しっかりしてよ！"]],
                                [["そっか，私も，もうひと踏ん張りしよっと！"],["あやしい〜〜"],["そうなの!?早いね！"]],
                                [["そっか，なら仕方ないね，頑張ってね","そっか，じゃあ今度時間ある時に行こうね"],["じゃあプラン考えておいてね！楽しみにしてる"]],
                                [["お願いね！"],["ここなんだけど，どうしたらいいかな"],["あ，できた！すごい！"]]]
var imgNumberList: [[Int]] = [[1,0],[3,2,0,0],[0,4,2,1],[0,1,2,2],[2,1],[4,0,0],[4,2],[0,2,0,1],[0,3,0],[2,2],[0,3,0]]
var talkFlag:Bool = true
var flag2: Bool = true
var randSerifNumber = 0
var img: String = imgList[5]
var cnt = 0.0
var timer : NSTimer!

class ViewController: UIViewController {
    
    @IBAction func unwindToTOP(segue: UIStoryboardSegue) {}
    @IBOutlet weak var gif: UIWebView!
    @IBOutlet weak var lastImgView: UIWebView!
    
    var targetURL = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
    var targetURL2 = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
    
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
    
    func loadAddressURL2() {
        var requestURL2 = NSURL(string: targetURL2!)
        var req = NSURLRequest(URL: requestURL2!)
        lastImgView.loadRequest(req)
        lastImgView.scalesPageToFit = true
    }
    
    @IBOutlet weak var textViewWindow: UIView!
    @IBOutlet weak var myTextView: UITextView!
 
    //talkモードにしたりしなかったり
    @IBAction func imgset(sender: UIButton) {
        if flag2==false {
            flag2=true
            textViewWindow.hidden = true
            gif.hidden = false
            lastImgView.hidden = true
            imgset(5)
        } else {
            flag2=false
            makeTalkWindow()
            lastImgView.hidden = false
        }
//        flag++
//        img  = imgList[flag%4]
//        targetURL = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
//        loadAddressURL()
//        println("result:\(img)")
    }
    

    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    func makeTalkWindow(){ //talkeもーどに入ります
        randSerifNumber = Int(arc4random_uniform(UInt32(serif.count))) //セリフ決定
        
        lastImgView.hidden = false
        textViewWindow.hidden = false
        //textViewWindow.backgroundColor = UIColor.whiteColor()
        myTextView.backgroundColor = UIColor.clearColor()
        myTextView.text = serif[randSerifNumber]
        myTextView.editable = false
        yesButtonView.setTitle(serifAnswer[randSerifNumber][0], forState: .Normal)
        noButtonView.setTitle(serifAnswer[randSerifNumber][1], forState: .Normal)
        yesButtonView.hidden = false
        noButtonView.hidden = false
    }
    
    @IBOutlet weak var yesButtonView: UIButton!
    @IBAction func yesButton(sender: AnyObject) {
        makeResultWindow(true)
    }
    @IBOutlet weak var noButtonView: UIButton!
    @IBAction func noButton(sender: AnyObject) {
        makeResultWindow(false)
    }
    
    //結果resultによって反応を変えます
    func makeResultWindow(result: Bool){
        cnt=0.0
         timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("stopImg"), userInfo: nil, repeats: true)
        if result == true{
            lastImgset(imgNumberList[randSerifNumber][0])
            imgset(imgNumberList[randSerifNumber][0])
            myTextView.text = serifResult[randSerifNumber][0][0] //3つめの[0]はいいかんじにすること
            yesButtonView.hidden = true
            noButtonView.hidden = true
        } else {
            lastImgset(imgNumberList[randSerifNumber][1])
            imgset(imgNumberList[randSerifNumber][1])
            myTextView.text = serifResult[randSerifNumber][1][0]
            yesButtonView.hidden = true
            noButtonView.hidden = true
        }
    }
    
    //指定した番号の女の子imgにします
    func imgset(number: Int){
        img  = imgList[number]
        targetURL = NSBundle.mainBundle().pathForResource(img, ofType: "gif")
        loadAddressURL()
    }
    
    func lastImgset(number: Int){
        targetURL2 = NSBundle.mainBundle().pathForResource(lastImgList[number], ofType: "gif")
        loadAddressURL2()
    }
    
    func stopImg(){
        cnt += 0.1
        if cnt > 2.4{
            gif.hidden = true
            timer.invalidate()
        }
    }


}
