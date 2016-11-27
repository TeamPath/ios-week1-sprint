//
//  HikesTableViewController.swift
//  Hikeit2
//
//  Created by Will Carty on 11/26/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase


class HikesTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    var refHandle: UInt!
    
    var userHikesId = FIRAuth.auth()?.currentUser?.uid
    
    
    var hikeList = [Hikes]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        fetchHikes()
        
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
                let header = view as! UITableViewHeaderFooterView
                header.textLabel?.font = UIFont(name: "Arial", size: 24)!
                header.textLabel?.textColor = UIColor(red: 54.0/255.0, green: 84.0/255.0, blue: 100.0/255.0, alpha: 1)
                header.contentView.backgroundColor = UIColor(red: 178.0/255.0, green: 221.0/255.0, blue: 214.0/255.0, alpha: 1)
                let bottomBorder = UIView(frame: CGRect(x: 0, y: 26, width: self.view.bounds.width, height: 2))
                bottomBorder.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
                header.contentView.addSubview(bottomBorder)
                let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 2))
                topBorder.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
                header.contentView.addSubview(topBorder)
            }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hikeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hikeCell", for: indexPath) as? HikeTableViewCell
        let imageString = hikeList[indexPath.row].HikeImage1
        let ConvertedImage = Utils.convertBase64ToImage(base64String: imageString)
        let resizedImage = Utils.resizeImage(image: ConvertedImage!, maxSize: 20)
        
        
        cell?.hikeTitle.text = hikeList[indexPath.row].HikeTitle
        cell?.imageView?.image = resizedImage
        cell?.hikeDate.text = String(describing: Date())
        cell?.hikeLocation.text = hikeList[indexPath.row].HikeLocation
        
        
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Hikes"
    }
    func fetchHikes(){
        refHandle = ref.child("Hikes").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                print(dictionary)
                let hikes = Hikes()
                hikes.setValuesForKeys(dictionary)
                self.hikeList.append(hikes)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        })
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "hikeSegueTable", sender: self)
//    }
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
