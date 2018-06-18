//
//  RestPasswordViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class RestPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    

    @IBAction func sendEmailBtn(_ sender: Any) {
        
        guard let email = emailTF.text, !email.isEmpty else{
            
            self.view.makeToast("enter your email", duration: 3.0, position: .bottom)
            return
        }
        
        guard Validate.isValidEmail(testStr: email) == true else{
            self.view.makeToast("Enter valid Email", duration: 3.0, position: .bottom)
            
            return
        }
        
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
