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
            let homeUservc = storyboard?.instantiateViewController(withIdentifier: "ContainerViewController")as! ContainerViewController
            self.present(homeUservc, animated: true, completion: nil)
            
        }else if (userTF.isChecked == false && owerTF.isChecked == true){
        
            let homeownervc = storyboard?.instantiateViewController(withIdentifier: "ContainerOwnerViewController") as! ContainerOwnerViewController
            self.present(homeownervc, animated: true, completion: nil)
        }
    }
    
  

}
