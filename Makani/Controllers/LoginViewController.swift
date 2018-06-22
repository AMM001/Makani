//
//  LoginViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var iconClick : Bool!
    var checkOwner:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        iconClick = true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else{
            self.view.makeToast("Enter your email", duration: 3.0, position: .bottom)
            return
        }
        guard Validate.isValidEmail(testStr: email) == true else{
            self.view.makeToast("Enter valid Email", duration: 3.0, position: .bottom)
            return
        }
        guard let password = passwordTF.text , !password.isEmpty else{
            self.view.makeToast("Enter your password", duration: 3.0, position: .bottom)
            return
        }
//        let homeOwnerVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeOwnerViewController") as! HomeOwnerViewController
//        self.present(homeOwnerVc, animated: true, completion: nil)
        let homeUserVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        self.present(homeUserVc, animated: true, completion: nil)
//        Authontication.login(email: emailTF.text!, password: passwordTF.text!, completion:{
//           (error,result) in
//            if(error == nil){
//                let user = result as! User
//                let homeUserVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
//               self.present(homeUserVc, animated: true, completion: nil)
//                //  self.navigationController?.pushViewController(homeUserVc, animated: true)
//                print(user.email)
//            }else {
//                print(error!.description)
//            }
//        })
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let registerVc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
         registerVc.checkOwner = checkOwner
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
    
//    var loginResult = { (error ,result) in
//
//    }
    
}
