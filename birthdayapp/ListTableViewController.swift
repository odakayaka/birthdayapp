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
    var logoImageView: UIImageView!
    
    @IBOutlet weak var listTable: UITableView!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
        listTable.reloadData()
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
        
        let dateFormatter = NSDateFormatter()//日付をフォーマット
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        cell.nameLabel.text = nowIndexPathDictionary["name"] as? String//Labelに代入
        cell.birthdayLabel.text = nowIndexPathDictionary["birthday"] as? String//Labelに代入
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSubView"){
            let subViewController = segue.destinationViewController as? SubViewController
            subViewController?.index = self.index
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.index = indexPath.row
        self.performSegueWithIdentifier("toSubView", sender: nil)
    }
    
    
    //削除
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //削除の時
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            wordArray.removeAtIndex(indexPath.row)
            saveData.setObject(wordArray, forKey: "WORD")
            listTable.reloadData()
        }
    }
    //Editボタンをおした時
    @IBAction func editButtonPushed(sender: AnyObject) {
        //通常モードと編集モードを切り替える。
        if(listTable.editing == true) {
            listTable.editing = false
        } else {
            listTable.editing = true
        }
    }
    //すべてのセルを対象に
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //セルの並び替えを有効にする
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let targetTitle = wordArray[sourceIndexPath.row]
        if let index = wordArray.indexOf(targetTitle) {
            wordArray.removeAtIndex(index)
            wordArray.insert(targetTitle, atIndex: destinationIndexPath.row)
        }
        
    }
}