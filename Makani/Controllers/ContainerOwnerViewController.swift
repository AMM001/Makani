//
//  ContainerOwnerViewController.swift
//  Makani
//
//  Created by mac on 6/6/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainerOwnerViewController: SlideMenuController{
    
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeOwnerViewController") {
            let homeOwnerVC = controller as! HomeOwnerViewController
           // homeOwnerVC.user = user!
            self.mainViewController = homeOwnerVC
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "MenuOwnerViewController") {
            let menuOwnerVc = controller as! MenuOwnerViewController
           // menuOwnerVc.user = user!
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }

    

}
