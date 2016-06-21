//
//  AddViewController.swift
//  birthdayapp
//
//  Created by 尾高文香 on 2016/06/22.
//  Copyright © 2016年 com.odakaayaka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var birthdayTextField:UITextField!
    
    //配列の読み込み
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
    }
    
    @IBAction func save(){
        let birthdayDictionary = ["name": nameTextField.text! , "birthday": birthdayTextField.text!]
        
        wordArray.append(birthdayDictionary)
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(title:"保存完了" , message:"新規登録が完了しました！" , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK" , style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        nameTextField.text = ""
        birthdayTextField.text = ""
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
