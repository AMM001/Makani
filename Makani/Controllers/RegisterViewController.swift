//
//  RegisterViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift

class RegisterViewController: UIViewController {
    private var objectCach = ObjectCach.getInstance()
    @IBOutlet weak var nameTF: TextField!
    @IBOutlet weak var emailTF: TextField!
    @IBOutlet weak var passwordTF: TextField!
    @IBOutlet weak var confirmTF: TextField!
    @IBOutlet weak var countryTF: TextField!
    @IBOutlet weak var phoneNubmerTF: TextField!
    private var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = objectCach.lookup(key: "User") as! User
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        guard let name = nameTF.text, !name.isEmpty else{
            self.view.makeToast("enter your Name", duration: 3.0, position: .bottom)
            return
        }
        guard let email = emailTF.text, !email.isEmpty else{
            self.view.makeToast("enter your Email", duration: 3.0, position: .bottom)
            return
        }
        
        guard let password = passwordTF.text, !password.isEmpty else{
            self.view.makeToast("enter your password", duration: 3.0, position: .bottom)
            return
        }
        
        guard let confirmpassword = confirmTF.text , confirmpassword == password  else{
            self.view.makeToast("password not matched", duration: 3.0, position: .bottom)
            return
        }
        
        guard let country = countryTF.text, !country.isEmpty else{
            self.view.makeToast("enter your country", duration: 3.0, position: .bottom)
            return
        }
        
        guard let phone = phoneNubmerTF.text, !phone.isEmpty else{
            self.view.makeToast("enter your phone number", duration: 3.0, position: .bottom)
            return
        }
        
        let secondRegisterVc = storyboard?.instantiateViewController(withIdentifier: "RegisterSecondScreenViewController") as! RegisterSecondScreenViewController        
        user?.name  = name
        user?.email = email
        user?.password = password
        user?.country = country
        user?.phone   = phone        
        self.present(secondRegisterVc, animated: true, completion: nil)
    }
    
}
