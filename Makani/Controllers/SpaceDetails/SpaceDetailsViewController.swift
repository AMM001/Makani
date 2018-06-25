//
//  SpaceDetailsViewController.swift
//  Makani
//
//  Created by Ahmed Osman on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import ImageSlideshow
import MapKit

class SpaceDetailsViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        print("dismiss")
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var superViewHeight: NSLayoutConstraint!
    @IBOutlet weak var roomsTableHeight: NSLayoutConstraint!
    @IBOutlet weak var spaceName: UILabel!
    @IBOutlet weak var spacePics: ImageSlideshow!
    @IBOutlet weak var spaceLocationsMap: MKMapView!
    @IBOutlet weak var spaceClosingTime: UILabel!
    @IBOutlet weak var spaceOpeningTime: UILabel!
    @IBOutlet weak var spaceAddress: UILabel!
    @IBOutlet weak var spaceEmail: UILabel!
    @IBOutlet weak var spaceTel: UILabel!
    @IBOutlet weak var spaceFacilitiesFirstLine: UILabel!
    @IBOutlet weak var spaceFacebook: UILabel!
    @IBOutlet weak var spaceWebsite: UILabel!
    @IBOutlet weak var spaceOverview: UILabel!
    @IBOutlet weak var roomsTableView: UITableView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var spaceFacilitiesSecondLine: UILabel!
    var  images = Array<SDWebImageSource>()
    
    @IBAction func bookNow(_ sender: Any) {
        
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        
    }
    
    var space:Space?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.aboutView.layer.cornerRadius = 5
        roomsTableView.delegate = self
        roomsTableView.dataSource = self
        //        self.aboutView.layer.borderColor = UIColor(named: "black")?.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("view height before update ")
        print(superViewHeight)
        superViewHeight.constant = superViewHeight.constant - roomsTableHeight.constant + roomsTableView.contentSize.height
        print("view height after update ")
        print(superViewHeight)
        roomsTableHeight.constant = roomsTableView.contentSize.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //                for image in (space?.pictures)! {
        //                    images.append(SDWebImageSource(urlString: image)!)
        //                }
        spaceName.text = space?.name
        for tel in (space?.contacts)! {
            if tel == space?.contacts.last {
                spaceTel.text?.append(tel)
            }
            spaceTel.text?.append(tel+" - ")
        }
        spaceOpeningTime.text = (space?.openingTime)!
        spaceClosingTime.text = (space?.closingTime)!
        for address in (space?.locations)! {
            spaceAddress.text = address.address + address.government + address.country
//            let annoutation = LocationAnnoutation(title: address.address, locationName: (space?.name)!, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(address.latitude)!),longitude: CLLocationDegrees(Double( address.longitude)!)))
//            spaceLocationsMap.addAnnotation(annoutation)
            
        }
        spaceEmail.text = space?.email
        spaceOverview.text=space?.overview
        spaceFacebook.text=space?.facebook
        spaceWebsite.text=space?.website
        spaceEmail.text=space?.email
        if(space?.facilities.airConditioner==true){
            spaceFacilitiesFirstLine.text="Air Condition - "
        }
        if(space?.facilities.internet==true){
            spaceFacilitiesFirstLine.text?.append("Internet - ")
            spaceFacilitiesFirstLine.text?.append(String(format: "%f",(space?.facilities.internetSpeed)!))
            
        }
        if(space?.facilities.foodDrinks==true){
            spaceFacilitiesSecondLine.text="foodDrinks"
        }
        
        if(space?.facilities.laptops==true){
            spaceFacilitiesSecondLine.text="Laptops"
        }
        if(space?.facilities.projector==true){
            spaceFacilitiesSecondLine.text="Projectors"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

extension SpaceDetailsViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (space?.rooms.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RoomCell = tableView.dequeueReusableCell(withIdentifier: "detailsRoomCell", for: indexPath) as!RoomCell
        // Configure the cell...
        cell.roomName.text = space?.rooms[indexPath.row].name
        cell.roomCapacity.text = space?.rooms[indexPath.row].capacity
        cell.roomCost.text = String(format: "%f", (space?.rooms[indexPath.row].cost)!)
        //        cell.roomName.text = "Big Room"
        //        cell.roomCapacity.text = "30 Person"
        //        cell.roomCost.text = "30$"
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
