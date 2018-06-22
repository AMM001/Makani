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
    
    @IBOutlet weak var spaceName: UILabel!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var spacePics: ImageSlideshow!
    @IBOutlet weak var spaceLocationsMap: MKMapView!
    @IBOutlet weak var spaceClosingTime: UILabel!
    @IBOutlet weak var spaceOpeningTime: UILabel!
    @IBOutlet weak var spaceAddress: UILabel!
    @IBOutlet weak var spaeEmail: UILabel!
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
    @IBAction func bookNow(_ sender: Any) {
        
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    
}
