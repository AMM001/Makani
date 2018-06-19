//
//  FirstViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift

class FirstViewController: UIViewController {
    
    @IBOutlet weak var userTF:ChangeImage!
    @IBOutlet weak var owerTF:ChangeImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance().font = UIFont(name: "Tale of Hawks.ttf", size: 50)


    }
    
    
    @IBAction func userChecked(_ sender: Any) {
        if(owerTF.isChecked == true){
            owerTF.isChecked = false
        }
    }
    
    @IBAction func ownerchecked(_ sender: Any) {
        if(userTF.isChecked == true){
            userTF.isChecked = false
        }
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        if (userTF.isChecked == false && owerTF.isChecked == false){
            self.view.makeToast("you should choice from this !", duration: 3.0, position: .bottom)
        }else if(userTF.isChecked == true && owerTF.isChecked == false){
            
            let loginUserVc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as! LoginViewController
            loginUserVc.checkOwner = false
            self.present(loginUserVc, animated: true, completion: nil)
        }else if (userTF.isChecked == false && owerTF.isChecked == true){
            
            let LoginOwnervc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            LoginOwnervc.checkOwner = true
            
            self.present(LoginOwnervc, animated: true, completion: nil)
        }
    }
    
  

}
