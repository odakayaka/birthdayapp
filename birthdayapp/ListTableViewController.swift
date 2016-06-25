//
//  ViewController.swift
//  birthdayapp
//
//  Created by 尾高文香 on 2016/06/22.
//  Copyright © 2016年 com.odakaayaka. All rights reserved.
//

import UIKit
//宣言
class ListTableViewController: UITableViewController  {
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    var selectedText: String?
    
    var index = 0
    
    @IBAction func back(segue: UIStoryboardSegue){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
        //let wordArray: AnyObject! = saveData.arrayForKey("WORD")
    }
    


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
    }
    
    //セクションの数を設定
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの個数を指定
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    //セルの中身の表示の仕方を設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]//wordArrayからDictionaryを取り出す
        
        cell.nameLabel.text = nowIndexPathDictionary["name"] as? String//Labelに代入
        cell.birthdayLabel.text = nowIndexPathDictionary["birthday"] as? String//Labelに代入
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//            performSegueWithIdentifier("toSubViewController", sender: nil)
//        selectedText = wordArray[indexPath.row] as! String
//    }
//    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSubView"){
            let subViewController = segue.destinationViewController as? SubViewController
            subViewController?.index = self.index
        }
    }
    //セルを選択！
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//       
//            let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SubViewController")as! UIViewController
//            self.presentViewController(targetViewController, animated: true, completion: nil)
//        
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.index = indexPath.row
        self.performSegueWithIdentifier("toSubView", sender: nil)
    }
}

