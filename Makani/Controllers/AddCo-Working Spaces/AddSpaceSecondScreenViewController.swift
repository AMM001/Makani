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
    var space:Space?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if (laptops.isChecked == true){
            space?.facilities.laptops = true
        }else{
            space?.facilities.laptops = false
        }
        if(airConditions.isChecked == true){
            space?.facilities.airConditioner = true
        }else{
            space?.facilities.airConditioner = false
        }
        if(projectors.isChecked == true){
            space?.facilities.projector = true
        }else {
            space?.facilities.projector = false
        }
        if(allowedFood.isChecked == true){
            space?.facilities.foodDrinks = true
        }else{
            space?.facilities.foodDrinks = false
        }
        if(internet.isChecked == true){
            space?.facilities.internet = true
        }else{
            space?.facilities.internet = false
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
        print(openening)
        space?.openingTime = openening
        space?.closingTime = closing
        space?.facebook = facebook
        addspacethirdVc.space = space
        self.present(addspacethirdVc, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func previousBtn(_ sender: Any) {        
        dismiss(animated: true, completion: nil)
    }
   
}
