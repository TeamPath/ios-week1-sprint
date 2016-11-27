//
//  HikesTableViewController.swift
//  Hikeit2
//
//  Created by Will Carty on 11/18/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

//import UIKit
//import Foundation
//
//class HikeTableViewController: UITableViewController {
//    
//    
//    let hike = Hike()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false
//        
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        //self.navigationItem.= self.editButtonItem
//        
//        
//    }
//    
//    // MARK: - Table view data source
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 3
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return HikeStore.shared.getCount(categorySet: hike.categorySet)
//    }
//    
//    
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//            
//        case 0:
//            return "Beginning Difficulty"
//        case 1:
//            return "Intermediate Difficulty"
//        case 2:
//            return "Expert Difficulty"
//        default:
//            return ""
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.font = UIFont(name: "Arial", size: 24)!
//        header.textLabel?.textColor = UIColor(red: 54.0/255.0, green: 84.0/255.0, blue: 100.0/255.0, alpha: 1)
//        header.contentView.backgroundColor = UIColor(red: 178.0/255.0, green: 221.0/255.0, blue: 214.0/255.0, alpha: 1)
//        let bottomBorder = UIView(frame: CGRect(x: 0, y: 26, width: self.view.bounds.width, height: 2))
//        bottomBorder.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
//        header.contentView.addSubview(bottomBorder)
//        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 2))
//        topBorder.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
//        header.contentView.addSubview(topBorder)
//    }
//    
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "hikeCell") as! HikeTableViewCell
////        
////        cell.setupCell(HikeStore.shared.getHike(indexPath.section, index: hike.categorySet))
////        
////        return cell
////    }
//    
//    //
//    //    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//    //
//    //    let header = view as! UITableViewHeaderFooterView
//    //
//    //    if let textlabel = header.textLabel {
//    //    textlabel.font = textlabel.font.withSize(15)
//    //    }
//       }
//    
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    
//    
//    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    
//    
//    
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        
//    }
//    
//    
//    
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
