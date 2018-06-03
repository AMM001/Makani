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
        }else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContainerViewController")as! ContainerViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
    }
    
  

}
