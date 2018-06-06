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
    
     @IBOutlet weak var segment: UISegmentedControl!

    let floaty = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment.setTitle("Space", forSegmentAt: 0)
        segment.setTitle("Event", forSegmentAt: 1)
        
        
        floaty.addItem(title: "add Event")
        floaty.addItem(title: "add Space")
        self.view.addSubview(floaty)

    }

    
    
    @IBAction func openMenuBtn(_ sender: Any) {
        
        self.slideMenuController()?.openLeft()

    }
    

   

}
