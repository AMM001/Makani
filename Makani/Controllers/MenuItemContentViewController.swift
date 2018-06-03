//
//  MenuItemContentViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MenuItemContentViewController: MenuViewController  {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameTF: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // imageview.layer.borderWidth = 0.5
      //  imageview.layer.masksToBounds = false
       // imageview.layer.borderColor = UIColor.white.cgColor
        imageview.layer.cornerRadius = imageview.frame.height/2
       // imageview.clipsToBounds = true

    }
    
    
    @IBAction func profileBtn(_ sender: Any) {
        
        let profilevc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(profilevc, animated: true, completion: nil)
    }
    

    

}
