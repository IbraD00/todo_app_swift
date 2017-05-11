//
//  ListViewController.swift
//  TodoApp
//
//  Created by Ibrahima Dansokho on 11/05/2017.
//  Copyright © 2017 ibra. All rights reserved.
//

import UIKit


class ListViewController: UITableViewController {

    class Task {
        var name: String
        var detail : String
        
        init(name: String, detail: String) {
            self.name = name
            self.detail = detail
        }
    }
    
    var Tasks: [Task] = [Task]()
    
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Ajouter une tache", message: "Nom de la tache", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Init app"
        }
        
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Detail de la card"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields?[0] // Force unwrapping because we know it exists.
            let detailField = alert?.textFields?[1]
            
            if !(textField?.text?.isEmpty)! && !(detailField?.text?.isEmpty)! {
                self.Tasks.append(Task(name: (textField?.text)!, detail: (detailField?.text)!))
                self.tableView.reloadData()
            }

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let task = Task(name: "Créer un compte", detail: "Voir comment on fait")
        Tasks.append(task)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = Tasks[indexPath.row].name
        cell.detailTextLabel?.text = Tasks[indexPath.row].detail
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCellAccessoryType.checkmark {
            cell?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }

        cell?.setSelected(false, animated: true)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
            if view.traitCollection.forceTouchCapability == .available {
                if touch.force == touch.maximumPossibleForce {
                    print("Xhat")
                }
            }
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
            self.Tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
