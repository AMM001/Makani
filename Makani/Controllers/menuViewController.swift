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
        imageview.clipsToBounds = true
        imageview.layer.borderWidth = 1.0
        imageview.layer.borderColor = UIColor.white.cgColor
        

    }

  
    @IBAction func profileBtn(_ sender: Any) {
        
        let profileVc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(profileVc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func aboutBtn(_ sender: Any) {
        
        let aboutVc = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.present(aboutVc, animated: true, completion: nil)
    }
    
  
    @IBAction func logoutBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "", message: "If you want confirm Logout Press Ok", preferredStyle: UIAlertControllerStyle.alert)
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        subview.backgroundColor = UIColor(red: (86/255.0), green: (204/255.0), blue: (242/255.0), alpha: 1.0)
        
        alert.view.tintColor = UIColor.white

        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
          
            let fVc = self.storyboard?.instantiateViewController(withIdentifier: "SplashViewController") as! SplashScreenViewController
            self.present(fVc, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
   
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let loginvc = storyboard?.instantiateViewController(withIdentifier:"LoginViewController") as! LoginViewController
        self.present(loginvc, animated: true, completion: nil)
        
        
        
    }
    
}
