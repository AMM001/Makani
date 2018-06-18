//
//  RegisterSecondScreenViewController.swift
//  Makani
//
//  Created by mac on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

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
    
    var name:String? , email:String? , password:String? , country:String? , phone:String?
    var design:Bool? , reading:Bool? , development:Bool? , sport:Bool? , photoghraphy:Bool? , medecine:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

  
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
        
        
        if ( designT.isChecked == true && readingT.isChecked == true && developmentT.isChecked == true && sportT.isChecked == true && photographyT.isChecked == true && medicineT.isChecked == true){
            
            design         =  true
            reading        =  true
            development    =  true
            sport          =  true
            photoghraphy   =  true
            medecine       = true
            
        }else{
            
            if (designT.isChecked == true){
                
                design = true
            }else{
                design = false
            }
            if(readingT.isChecked == true){
                reading = true
            }else{
                reading = false
            }
            if(developmentT.isChecked == true){
                development = true
            }else {
                development = false
            }
            if(sportT.isChecked == true){
                sport = true
            }else{
                sport = false
            }
            if(photographyT.isChecked == true){
                photoghraphy = true
            }else{
                photoghraphy = false
            }
            
            if(medicineT.isChecked == true){
                medecine = true
            }else{
                medecine = false
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
            
            
            print("Done")
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    

}