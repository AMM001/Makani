//
//  AddSpaceSecondScreenViewController.swift
//  Makani
//
//  Created by mac on 6/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AddSpaceSecondScreenViewController: UIViewController {
    
    @IBOutlet weak var openingTF: AddSpaceTextField!
    
    @IBOutlet weak var closingTF: AddSpaceTextField!
    
    @IBOutlet weak var facebookLinkTF: AddSpaceTextField!
    
    @IBOutlet weak var laptops: ChangeImage!
    @IBOutlet weak var airConditions: ChangeImage!
    
    @IBOutlet weak var projectors: ChangeImage!
    
    @IBOutlet weak var allowedFood: ChangeImage!
    
    @IBOutlet weak var internet: ChangeImage! 
    
    var spaceName:String? , numberPhone:String? , country:String? , government:String? , spaceAddress:String? , email:String? , website:String?
    
    var laptopsT:Bool? , airConditionsT:Bool? , projectorsT:Bool? , allowedFoodT:Bool? , internetT:Bool?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
  
    }

  
    @IBAction func nextBtn(_ sender: Any) {
        
        if ( laptops.isChecked == true && airConditions.isChecked == true && projectors.isChecked == true && allowedFood.isChecked == true && internet.isChecked == true){
            
            laptopsT       =  true
            airConditionsT =  true
            projectorsT    =  true
            allowedFoodT   =  true
            internetT      =  true
            
        }else{
            
            if (laptops.isChecked == true){
                
                laptopsT = true
            }else{
                laptopsT = false
            }
            if(airConditions.isChecked == true){
                airConditionsT = true
            }else{
                airConditionsT = false
            }
            if(projectors.isChecked == true){
                projectorsT = true
            }else {
                projectorsT = false
            }
            if(allowedFood.isChecked == true){
                allowedFoodT = true
            }else{
                allowedFoodT = false
            }
            if(internet.isChecked == true){
                internetT = true
            }else{
                internetT = false
            }
        }
        
        
        
        
        guard let openening = openingTF.text, !openening.isEmpty else{
            
            self.view.makeToast("enter open Time", duration: 3.0, position: .bottom)
            return
        }
        guard let closing = closingTF.text, !closing.isEmpty else{
            
            self.view.makeToast("enter close Time", duration: 3.0, position: .bottom)
            return
        }
        
        guard let facebook = facebookLinkTF.text, !facebook.isEmpty else{
            
            self.view.makeToast("enter facebook link", duration: 3.0, position: .bottom)
            return
        }
        
        
        let addspacethirdVc = storyboard?.instantiateViewController(withIdentifier: "AddSpaceThirdViewController") as! AddSpaceThirdViewController
        
        addspacethirdVc.opening             = openening
        addspacethirdVc.closing             = closing
        addspacethirdVc.facebbolLink        = facebook
        addspacethirdVc.laptops             = laptopsT
        addspacethirdVc.airConditions       = airConditionsT
        addspacethirdVc.projectors          = projectorsT
        addspacethirdVc.allowedFood         = allowedFoodT
        addspacethirdVc.internet            = internetT
        
        self.present(addspacethirdVc, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func previousBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
