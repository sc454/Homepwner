//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by sravya chelikani on 11/8/17.
//  Copyright © 2017 Mohu. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // to allow changes in detail view controller
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create instance of UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath) as! ItemCell
        let item = itemStore.allItems[indexPath.row]
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.priceLabel.text = "$\(item.valueInDollars)"
        return cell
    }
    
    @IBAction func addNewItem(_ sender : UIBarButtonItem){
       let newItem = itemStore.createItem()
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    //To delete a row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]
            // Create alert before deletion
            let title = "Delete \(item.name)"
            let message = "Are you sure you want to delete this item?"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action) -> Void in
            self.itemStore.removeItem(item)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)})
            alert.addAction(deleteAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // Pass item around with segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier{
        case "showItemSegue"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
