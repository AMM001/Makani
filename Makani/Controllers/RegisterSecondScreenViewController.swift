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
    private var objectCach = ObjectCach.getInstance()
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
    private var user:User?
    var interestsArray = Array<Interest>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user?.owner == true {
            designT.isHidden = true
            readingT.isHidden = true
            developmentT.isHidden = true
            sportT.isHidden = true
            photographyT.isHidden = true
            medicineT.isHidden = true
            interestLabel.isHidden = true
        }
        user = objectCach.lookup(key: "User") as! User
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registerBtn(_ sender: Any) {
        if (designT.isChecked == true){
            let interest = Interest()
            interest.id = 1
            interest.name = "Design"
            interestsArray.append(interest)
        }
        if(readingT.isChecked == true){
            let interest = Interest()
            interest.id = 2
            interest.name = "Reading"
            interestsArray.append(interest)
        }
        if(developmentT.isChecked == true){
            let interest = Interest()
            interest.id = 3
            interest.name = "Development"
            interestsArray.append(interest)
        }
        if(sportT.isChecked == true){
            let interest = Interest()
            interest.id = 4
            interest.name = "Sport"
            interestsArray.append(interest)
        }
        if(photographyT.isChecked == true){
            let interest = Interest()
            interest.id = 5
            interest.name = "Photography"
            interestsArray.append(interest)
        }
        if(medicineT.isChecked == true){
            let interest = Interest()
            interest.id = 6
            interest.name = "Medicine"
            interestsArray.append(interest)
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
        user?.birthdate = birthdate
        user?.gender = gender
        user?.government = government
        user?.interests = interestsArray
print(user)
        let alert = UIAlertController(title: "", message: "Confirm Registeration ?", preferredStyle: UIAlertControllerStyle.alert)
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.backgroundColor = UIColor(red: (86/255.0), green: (204/255.0), blue: (242/255.0), alpha: 1.0)
        alert.view.tintColor = UIColor.white
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print(self.interestsArray.count)
            Authontication.RegisterUser(user: self.user!, completion: { (error, result) in
                if error == nil {
                    if self.user?.owner == false {
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
