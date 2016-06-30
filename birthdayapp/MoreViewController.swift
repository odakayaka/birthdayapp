//
//  MoreViewController.swift
//  birthdayapp
//
//  Created by 尾高文香 on 2016/06/30.
//  Copyright © 2016年 com.odakaayaka. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet var daysFromLable: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var nengouLabel: UILabel!
    @IBOutlet var seizaLabel: UILabel!
    @IBOutlet var etoLabel: UILabel!
    
    var index: Int = 0
    var data : [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = NSUserDefaults.standardUserDefaults()
        if let array = ud.arrayForKey("WORD") {
            print(array)
            data = array[index] as! [String : String]
        }
        
        let dateFormatter = NSDateFormatter()//日付をフォーマット
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        birthdayLabel.text = data["birthday"]
        
        let birthday = data["birthday"]
        let bdDate = dateFormatter.dateFromString(birthday!)
        
        daysFromLable.text = "\(NSDate().daysFrom(bdDate!))"
        
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let bdyear:Int = calendar.component(.Year, fromDate: bdDate!)
        let bdmonth:Int = calendar.component(.Month, fromDate: bdDate!)
        let bdday:Int = calendar.component(.Day, fromDate: bdDate!)
        //月を100倍して日を足す
        let mmdd = bdmonth * 100 + bdday;
        
        if ((mmdd >= 321 && mmdd <= 331) || (mmdd >= 401 && mmdd <= 419)) {
            seizaLabel.text = "牡羊座";
        } else if ((mmdd >= 421 && mmdd <= 430) || (mmdd >= 501 && mmdd <= 519)) {
            seizaLabel.text = "おうし座";
            
        } else if ((mmdd >= 521 && mmdd <= 531) || (mmdd >= 601 && mmdd <= 619)) {
            seizaLabel.text = "ふたご座";
            
        } else if ((mmdd >= 621 && mmdd <= 630) || (mmdd >= 701 && mmdd <= 719)) {
            seizaLabel.text = "かに座";
            
        } else if ((mmdd >= 721 && mmdd <= 731) || (mmdd >= 801 && mmdd <= 819)) {
            seizaLabel.text = "しし座";
            
        } else if ((mmdd >= 821 && mmdd <= 831) || (mmdd >= 901 && mmdd <= 919)) {
            seizaLabel.text = "おとめ座";
            
        } else if ((mmdd >= 921 && mmdd <= 930) || (mmdd >= 1001 && mmdd <= 1019)) {
            seizaLabel.text = "てんびん座";
            
        } else if ((mmdd >= 1021 && mmdd <= 1031) || (mmdd >= 1101 && mmdd <= 1119)) {
            seizaLabel.text = "さそり座";
            
        } else if ((mmdd >= 1121 && mmdd <= 1130) || (mmdd >= 1201 && mmdd <= 1219)) {
            seizaLabel.text = "いて座";
            
        } else if ((mmdd >= 1221 && mmdd <= 1231) || (mmdd >= 101 && mmdd <= 119)) {
            seizaLabel.text = "やぎ座";
            
        } else if ((mmdd >= 121 && mmdd <= 131) || (mmdd >= 201 && mmdd <= 219)) {
            seizaLabel.text = "みずがめ座";
            
        } else if ((mmdd >= 221 && mmdd <= 228) || (mmdd >= 301 && mmdd <= 319)) {
            seizaLabel.text = "うお座";
        }else{
            seizaLabel.text = nil
        }
        
        //年号

        let eraJpArray: Array<String> = ["明治", "大正", "昭和", "平成"]
        
        let strbdyear = bdyear.description
        let strbdmonth = bdmonth.description
        let strbdday = bdday.description
        
        // 引数 year, month, day をデートフォーマット用にString(YYYY/MM/DD)にする
        let strConverDay: String = String(strbdyear) + "/" + String(strbdmonth) + "/" + String(strbdday)
        let convertDay = dateFormatter.dateFromString(strConverDay)!.timeIntervalSinceReferenceDate
        
        let maiji  = dateFormatter.dateFromString("1868/10/23")!.timeIntervalSinceReferenceDate
        let taisyo = dateFormatter.dateFromString("1912/7/30")!.timeIntervalSinceReferenceDate
        let syowa  = dateFormatter.dateFromString("1926/12/26")!.timeIntervalSinceReferenceDate
        let heisei = dateFormatter.dateFromString("1989/1/7")!.timeIntervalSinceReferenceDate
        
        switch(convertDay) {
        case maiji..<taisyo:
            nengouLabel.text =  "\(eraJpArray[0] + String(bdyear - 1867))"
        case taisyo..<syowa:
            nengouLabel.text =  "\(eraJpArray[1] + String(bdyear - 1911))"
        case syowa..<heisei:
            nengouLabel.text = "\(eraJpArray[2] + String(bdyear - 1925))"
        default:
            nengouLabel.text = "\(eraJpArray[3] + String(bdyear - 1988))"
        }
        
        //干支
        
        var etoArray = ["申", "酉", "戌", "亥", "子", "丑", "寅", "卯", "辰", "巳", "午", "未"]
        etoLabel.text = "\(etoArray[bdyear % 12])"

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
