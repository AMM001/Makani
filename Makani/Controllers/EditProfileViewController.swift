//
//  EditProfileViewController.swift
//  Makani
//
//  Created by mac on 6/5/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var governmentTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeBorderTextField()
        
        
        
        

        
    }

    @IBAction func updateProfileBtn(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "", message: "Are you sure you want to save editing ?", preferredStyle: UIAlertControllerStyle.alert)
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
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
  
}
extension EditProfileViewController {
    
    func changeBorderTextField()  {
        
        let myColor : UIColor = UIColor.darkGray
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = myColor.cgColor
        nameTF.layer.cornerRadius = 5
        
        countryTF.layer.borderWidth = 1
        countryTF.layer.borderColor = myColor.cgColor
        countryTF.layer.cornerRadius = 5
        
        phoneTF.layer.borderWidth = 1
        phoneTF.layer.borderColor = myColor.cgColor
        phoneTF.layer.cornerRadius = 5
        
        genderTF.layer.borderWidth = 1
        genderTF.layer.borderColor = myColor.cgColor
        genderTF.layer.cornerRadius = 5
        
        governmentTF.layer.borderWidth = 1
        governmentTF.layer.borderColor = myColor.cgColor
        governmentTF.layer.cornerRadius = 5
        
        
    }
    
    
    
}









