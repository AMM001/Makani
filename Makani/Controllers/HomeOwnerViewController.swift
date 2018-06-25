//
//  HomeOwnerViewController.swift
//  Makani
//
//  Created by mac on 6/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Floaty
import SlideMenuControllerSwift

class HomeOwnerViewController: UIViewController {
    private var objectCach = ObjectCach.getInstance()
    @IBOutlet weak var spacesTableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    private var user:User?
    let floaty = Floaty()
    let item1 = FloatyItem()
    let item2 = FloatyItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spacesTableView.delegate = self
        spacesTableView.dataSource = self
        segment.setTitle("Space", forSegmentAt: 0)
        segment.setTitle("Event", forSegmentAt: 1)
        item1.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item1.icon = UIImage(named:"event iconn")
        item1.iconImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        item1.titleLabel.backgroundColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item1.titleLabel.font = UIFont(name: "Roboto-Regular.ttf", size: 2)
        item1.titleLabel.layer.cornerRadius = 10
        item1.title = "Add Event"
        item1.handler = {item1 in
            print("item1 pressed")
        }
        item2.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item2.icon = UIImage(named:"space icon")
        item2.iconImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        item2.titleLabel.backgroundColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        item2.titleLabel.font = UIFont(name: "Roboto-Regular.ttf", size: 2)
        item2.titleLabel.layer.cornerRadius = 10
        item2.title = "Add Space"
        item2.handler = { item2 in
            let addSpaceVc = self.storyboard?.instantiateViewController(withIdentifier: "AddSpaceViewController") as! AddSpaceViewController
            self.present(addSpaceVc, animated: true, completion: nil)
        }
        floaty.addItem(item: item2)
        floaty.addItem(item: item1)
        floaty.buttonColor = UIColor(red: 28.0/255, green: 75.0/255, blue: 137.0/255, alpha: 1.0)
        floaty.plusColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.view.addSubview(floaty)
        user = objectCach.lookup(key: "User") as? User
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(user)
        if !(user?.spaces.isEmpty)!{
            spacesTableView.alpha = 1
        }
        spacesTableView.reloadData()
    }
    @IBAction func openMenuBtn(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
}
extension HomeOwnerViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return (space?.rooms.count)!
        return (user?.spaces.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeSpaceCell", for: indexPath) as! SpacesTableViewCell
        // Configure the cell...
        cell.spaceName.text = user?.spaces[indexPath.row].name
        cell.spaceAddress.text = user?.spaces[indexPath.row].locations[0].address
        return cell
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
