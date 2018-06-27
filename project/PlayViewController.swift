//
//  PlayViewController.swift
//  project
//
//  Created by Lab on 2018/6/26.
//  Copyright © 2018年 Lab. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    var record: Record?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var spend: UILabel!
    @IBOutlet weak var texts: UITextField!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var dateString = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 獲取當前時間
        
        let now:Date = Date()
        
        // 建立時間格式
        
        let dateFormat:DateFormatter = DateFormatter()
        
        dateFormat.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        // 將當下時間轉換成設定的時間格式
        
        dateString = dateFormat.string(from: now)
        
        //print("現在時間：\(dateString)") // 現在時間：2018年01月29日 15:34:23
        
        if let record = record {
            name.text = record.name
            spend.text = record.spend
            dateString = record.time
        }
        
        texts.isEnabled = false
        spend.text = String(counter)
        
        let alertController = UIAlertController(title: "輸入名字後\n按下開始就可以開始打a~z摟！", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "我知道了", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        name.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        spend.text = String(format: "%.1f", counter)
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        name.isEnabled = false
        if(name.text?.count == 0) {
            let alertController = UIAlertController(title: "請先輸入名字", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            name.isEnabled = true
            name.becomeFirstResponder()
            return
        }
        else {
            texts.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlaying = true
            texts.becomeFirstResponder()
        }
        
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        texts.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        print(11111111)
        if(texts.text != "abcdefghijklmnopqrstuvwxyz") {
            let alertController = UIAlertController(title: "這不是a~z", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
            timer.invalidate()
        performSegue(withIdentifier: "goBackToRecordTTableWithSegue", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(15)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if record == nil{
            record = Record(name: name.text!, spend: spend.text!, time: dateString)
        }
        else {
            record?.name = name.text!
            record?.spend = spend.text!
            record?.time = dateString
        }
    }
}
