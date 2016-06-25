//
//  AddViewController.swift
//  birthdayapp
//
//  Created by 尾高文香 on 2016/06/22.
//  Copyright © 2016年 com.odakaayaka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    //宣言
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var birthdayTextField:UITextField!
    var toolBar: UIToolbar!
    
    //配列の読み込み
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading; the; view.
//        
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
        
        //datepicker上のtoolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "Done" , style: .Plain , target: self , action: #selector(doneBtn))
        toolBar.items = [toolBarBtn]
        birthdayTextField.inputAccessoryView = toolBar
    }
    
    //テキストフィールドが選択されたらdatepickerを表示
    @IBAction func textFieldEditing(sender: UITextField){
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //datepickerが選択されたらtextfieldに表示
    func datePickerValueChanged(sender:UIDatePicker){
        let dateFormatter = NSDateFormatter()
       dateFormatter.dateFormat  = "yyyy/MM/dd";
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func doneBtn(){
        birthdayTextField.resignFirstResponder()
    }
    
    //保存！
    @IBAction func save(){
        let birthdayDictionary = ["name": nameTextField.text! , "birthday": birthdayTextField.text!]
        
        
        wordArray.append(birthdayDictionary)
        saveData.setObject(wordArray, forKey: "WORD")
        NSUserDefaults.standardUserDefaults().synchronize()
        
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
