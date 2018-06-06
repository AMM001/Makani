//
//  HomeOwnerViewController.swift
//  Makani
//
//  Created by mac on 6/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeOwnerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func openMenuBtn(_ sender: Any) {
        
        self.slideMenuController()?.openLeft()

    }
    

   

}
