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
