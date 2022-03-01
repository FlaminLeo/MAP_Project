//
//  CategoryTableViewController.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 22/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var categories: [Categories]!
    var catID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = retrieveCategory()
        tableView.dataSource = self
        tableView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCat", for: indexPath) as! CategoryTableViewCell
        
        cell.catImg.image = UIImage(named: categories[indexPath.row].categoryImage ?? "")
        cell.catName.text = categories[indexPath.row].categoryName
        cell.catDesc.text = categories[indexPath.row].categoryDescription
    
        
        // Configure the cell...

        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catID = indexPath.row
        performSegue(withIdentifier: "toProducts", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toProducts" {
            let productCategory = segue.destination as! ProductTableViewController
            productCategory.categoryID = categories[catID].categoryID
            productCategory.catTitle = categories[catID].categoryName ?? ""
            
        }
    }
    
    @IBAction func unwindtoCategories( _ seg: UIStoryboardSegue) {
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


    //MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
