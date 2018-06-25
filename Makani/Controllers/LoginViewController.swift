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
    private var objectCach = ObjectCach.getInstance()
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var iconClick : Bool!
    private var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconClick = true
        user = objectCach.lookup(key: "User") as? User
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
        Authontication.login(email: emailTF.text!, password: passwordTF.text!, completion:{
            (error,result) in
            if(error == nil){
                self.user = result as? User
                //                let realm = try! Realm()
                //                try! realm.write {
                //                    realm.deleteAll()
                //                    realm.add(self.user!)
                //                }
                if (self.user?.owner)! {
                    let homeOwnerVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerOwnerViewController") as! ContainerOwnerViewController
                    self.present(homeOwnerVc, animated: true, completion: nil)
                }else{
                    let homeUserVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController                    
                    self.present(homeUserVc, animated: true, completion: nil)
                }
                //                if(self.user?.owner == false ){
                //                    if(user.owner == false){
                //
                //                let homeUserVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
                //               self.present(homeUserVc, animated: true, completion: nil)
                //
                //                    }else if(user.owner == true){
                //                        self.view.makeToast("user not found ", duration: 3.0, position: .bottom)
                //                    }
                //                }else if(self.checkOwner == true ) {
                //                    if(user.owner == true){
                //
                //                        let homeownerVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerOwnerViewController") as! ContainerOwnerViewController
                //                        self.present(homeownerVc, animated: true, completion: nil)
                //                    }else if(user.owner == false){
                //                        self.view.makeToast("owner not found ", duration: 3.0, position: .bottom)
                //                    }
                //                }
            }else {
                print(error!.description)
                self.view.makeToast("email or password is not valid ", duration: 3.0, position: .bottom)
            }
            
            
        })
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
    
    //    var loginResult = { (error ,result) in
    //
    //    }
    
}
