//
//  EditRecordTableViewController.swift
//  project
//
//  Created by Lab on 2018/6/26.
//  Copyright © 2018年 Lab. All rights reserved.
//

import UIKit

class EditRecordTableViewController: UITableViewController {

    var record: Record?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var spend: UITextField!
    @IBOutlet weak var time: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let record = record {
            name.text = record.name
            spend.text = record.spend
            time.text = record.time
        }
        spend.isEnabled = false
        time.isEnabled = false
        //spend.isEnabled = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
/*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    */
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        if name.text?.count == 0 {
            let alertController = UIAlertController(title: "請輸入名字", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        performSegue(withIdentifier: "goBackToRecordTableWithSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if record == nil{
            record = Record(name: name.text!, spend: spend.text!, time: time.text!)
        }
        else {
            record?.name = name.text!
            record?.spend = spend.text!
            record?.time = time.text!
        }
    }
 

}
