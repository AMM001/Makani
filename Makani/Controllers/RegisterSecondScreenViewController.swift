//
//  RegisterSecondScreenViewController.swift
//  Makani
//
//  Created by mac on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift

class RegisterSecondScreenViewController: UIViewController {
    
    @IBOutlet weak var governmentTF: TextField!
    @IBOutlet weak var genderTF: TextField!
    @IBOutlet weak var birthdateTF: TextField!
    
    @IBOutlet weak var designT: ChangeImage!
    @IBOutlet weak var readingT: ChangeImage!
    @IBOutlet weak var developmentT: ChangeImage!
    @IBOutlet weak var sportT: ChangeImage!
    @IBOutlet weak var photographyT: ChangeImage!
    @IBOutlet weak var medicineT: ChangeImage!
    @IBOutlet weak var interestLabel: UILabel!
    
    var name:String? , email:String? , password:String? , country:String? , phone:String?
//    var design:Bool? , reading:Bool? , development:Bool? , sport:Bool? , photoghraphy:Bool? , medecine:Bool?
    var interestsArray:Array<String> = []
    var checkOwner:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if checkOwner == true {
            
            designT.isHidden = true
            readingT.isHidden = true
            developmentT.isHidden = true
            sportT.isHidden = true
            photographyT.isHidden = true
            medicineT.isHidden = true
            interestLabel.isHidden = true
            
        }

    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
 
        if ( designT.isChecked == true && readingT.isChecked == true && developmentT.isChecked == true && sportT.isChecked == true && photographyT.isChecked == true && medicineT.isChecked == true){
//
//            design         =  true
//            reading        =  true
//            development    =  true
//            sport          =  true
//            photoghraphy   =  true
//            medecine       =  true
            
            interestsArray.append("design")
            interestsArray.append("reading")
            interestsArray.append("development")
            interestsArray.append("sport")
            interestsArray.append("photography")
            interestsArray.append("medecine")

        }else{
            
            if (designT.isChecked == true){

                interestsArray.append("design")
            }else{
             print("not design ")

            }
            if(readingT.isChecked == true){
             
                interestsArray.append("reading")

            }else{
            
                print("not reading")

            }
            if(developmentT.isChecked == true){
    
                interestsArray.append("development")

            }else {
          
               print("not development")
            }
            if(sportT.isChecked == true){
        
                interestsArray.append("sport")

            }else{
    
                 print("not sport")

            }
            if(photographyT.isChecked == true){
         
                interestsArray.append("photoghraphy")

            }else{
        
               print("not photoghraphy")

            }
            
            if(medicineT.isChecked == true){
        
                interestsArray.append("medecine")

            }else{
         
                print("not medecine")

            }
        
        
    }
        
        
        guard let government = governmentTF.text, !government.isEmpty else{
            
            self.view.makeToast("enter your government", duration: 3.0, position: .bottom)
            return
        }
        
        guard let gender = genderTF.text, !gender.isEmpty else{
            
            self.view.makeToast("enter your gender", duration: 3.0, position: .bottom)
            return
        }
        
        guard let birthdate = birthdateTF.text, !birthdate.isEmpty else{
            
            self.view.makeToast("enter your birthdate", duration: 3.0, position: .bottom)
            return
        }
        
        
        let alert = UIAlertController(title: "", message: "Confirm Registeration ?", preferredStyle: UIAlertControllerStyle.alert)
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        subview.backgroundColor = UIColor(red: (86/255.0), green: (204/255.0), blue: (242/255.0), alpha: 1.0)
        
        alert.view.tintColor = UIColor.white
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            print(self.interestsArray.count)
            
            Authontication.RegisterUser(name:self.name!,email: self.email!, password: self.password!, phone: self.phone!, country: self.country!, government: government, gender: gender, birthdate: birthdate, photo: "", job: "", intrests:self.interestsArray, owner: self.checkOwner!, skills: [], userEvent: [], spaces: [], events: [], completion: { (error, result) in
                
                if error == nil {
                    if self.checkOwner == false {
                    
                    let homeUserVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
            
                    self.present(homeUserVc, animated: true, completion: nil)
                    
                    }
                        else{
                            let homeOnerVC = self.storyboard?.instantiateViewController(withIdentifier: "ContainerOwnerViewController") as! ContainerOwnerViewController
                        
                            self.present(homeOnerVC, animated: true, completion: nil)
                            
                            
                        }
                 
                }
                else{
                    
                    self.view.makeToast("error check again\(String(describing: error?.description))", duration: 3.0, position: .bottom)
                    print("error check again\(String(describing: error?.description))")
                }
            })
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    
        
        
    }
    

}
