//
//  SlideMenuViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.layer.cornerRadius = imageview.frame.height/2
    }

  
    @IBAction func profileBtn(_ sender: Any) {
        
        print("sdfsd")
    }
    
  
    @IBAction func logoutBtn(_ sender: Any) {
        
        let fVc = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.present(fVc, animated: true, completion: nil)
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let loginvc = storyboard?.instantiateViewController(withIdentifier:"LoginViewController") as! LoginViewController
        self.present(loginvc, animated: true, completion: nil)
        
        
        
    }
    
}
