//
//  LoginViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    var iconClick : Bool!


    override func viewDidLoad() {
        super.viewDidLoad()
        iconClick = true



    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        guard let email = emailTF.text, !email.isEmpty else{
            
            self.view.makeToast("enter your email", duration: 3.0, position: .bottom)
            return
        }
        
        guard Vladiate.isValidEmail(testStr: email) == true else{
            self.view.makeToast("Enter valid Email", duration: 3.0, position: .bottom)
            
            return
        }
        
        guard let password = passwordTF.text , !password.isEmpty else{
            
            self.view.makeToast("enter your password", duration: 3.0, position: .bottom)
            return
        }
        
     
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        
        let registerVc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.present(registerVc, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func controlSecure(_ sender: Any) {
        
        if(iconClick == true) {
            passwordTF.isSecureTextEntry = false
            iconClick = false
        } else {
            passwordTF.isSecureTextEntry = true
            iconClick = true
        }
        
        
    }
    

}
