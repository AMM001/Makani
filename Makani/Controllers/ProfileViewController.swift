//
//  ProfileViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController  {
    
    @IBOutlet weak var imageview: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageview.layer.cornerRadius = imageview.frame.height/2
        imageview.clipsToBounds = true
        imageview.layer.borderWidth = 1.0
        imageview.layer.borderColor = UIColor.white.cgColor

    }

   
    

    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
