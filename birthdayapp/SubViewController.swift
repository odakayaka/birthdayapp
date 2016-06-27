//
//  SubViewController.swift
//  birthdayapp
//
//  Created by 尾高文香 on 2016/06/22.
//  Copyright © 2016年 com.odakaayaka. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLable: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var birthdaycountLable: UILabel!
    
    var index: Int = 0
    
    var data : [String: String] = [:]
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(index)
        // Do any additional setup after loading the view.
//        tableView.delegate = self
//        tableView.dataSource = self
        let ud = NSUserDefaults.standardUserDefaults()
        if let array = ud.arrayForKey("WORD") {
            print(array)
            data = array[index] as! [String : String]
        }
        
        let dateFormatter = NSDateFormatter()//日付をフォーマット
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        nameLabel.text = data["name"]
        birthdayLabel.text = data["birthday"]
        
        let birthday = data["birthday"]
        let bdDate = dateFormatter.dateFromString(birthday!)
        print(bdDate)
        print(NSDate().yearsFrom(bdDate!))
        
        ageLable.text = "\(NSDate().yearsFrom(bdDate!))"
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let bdyear:Int = calendar.component(.Year, fromDate: bdDate!)
        let bdmonth:Int = calendar.component(.Month, fromDate: bdDate!)
        let bdday:Int = calendar.component(.Day, fromDate: bdDate!)
        
        let now = NSDate()
        let nowyear:Int = calendar.component(.Year, fromDate: now)
        let nowmonth:Int = calendar.component(.Month, fromDate: now)
        let nowday:Int = calendar.component(.Day, fromDate: now)
        
        let dateFormatter2 = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        var y = nowyear
        
        if (nowmonth > bdmonth){
            y = nowyear + 1
        }else if ((nowmonth == bdmonth) && (nowday > bdday)){
           y = nowyear + 1
        }
        
        let inputDate2 = dateFormatter.dateFromString(String(y) + "/" + String(bdmonth) + "/" + String(bdday))
        
        
        birthdaycountLable.text = "\(inputDate2!.daysFrom(now))"
        
        // 
        // 今年の月日でNSDate型で作る
        // 誕生日の残り日数の計算
        
        //誕生日の西暦を現在の西暦に直す
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(text)
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
