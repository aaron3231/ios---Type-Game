//
//  RecordTableViewController.swift
//  project
//
//  Created by Lab on 2018/6/26.
//  Copyright © 2018年 Lab. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {
    
    var records = [Record]()
    
    @IBAction func goBackToRecordTable(segue: UIStoryboardSegue) {
        let controller = segue.source as? EditRecordTableViewController
        print(3)
        if  let record = controller?.record {
            if let row = tableView.indexPathForSelectedRow?.row {
                records[row] = record
                print(2)
            } else {
                records.insert(record, at: 0)
                print(records)
                print(1)
            }
            tableView.reloadData()
        }
    }
    @IBAction func goBackToRecordTTable(segue: UIStoryboardSegue) {
        let controller = segue.source as? PlayViewController
        print(23)
        if  let record = controller?.record {
            if let row = tableView.indexPathForSelectedRow?.row {
                records[row] = record
                print(22)
            } else {
                records.insert(record, at: 0)
                print(records)
                print(21)
            }
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(33)
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)as! RecordTableViewCell
        print(34)
        let record = records[indexPath.row]
        cell.name.text = record.name
        cell.spend.text = record.spend
        cell.time.text = record.time
        print(35)
        return cell
    }
    @IBAction func questClick(_ sender: Any) {
        let alertController = UIAlertController(title: "按下＋可以進行遊戲\n按紀錄可以進行編輯", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        records.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
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

    /* */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print(12)
        if let row = tableView.indexPathForSelectedRow?.row {
            let record = records[row]
            let controllers = segue.destination as? EditRecordTableViewController
            let controller = segue.destination as? PlayViewController
            controller?.record =  record
            controllers?.record =  record
        }
        print(13)
    }

}
