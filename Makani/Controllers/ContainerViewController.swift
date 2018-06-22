//
//  ContainerViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainerViewController:SlideMenuController {

    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Home") {
            self.mainViewController = controller
        }
        if let sideController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") {
            let controller = sideController as! MenuViewController
            controller.user = user!
            self.leftViewController = sideController
        }
        super.awakeFromNib()
    }

   
}
