//
//  AddSpaceViewController.swift
//  Makani
//
//  Created by mac on 6/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Toast_Swift

class AddSpaceViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var spaceNameTF: AddSpaceTextField!
    @IBOutlet weak var numberPhoneTF: AddSpaceTextField!
    @IBOutlet weak var countryTF: AddSpaceTextField!
    @IBOutlet weak var governmentTF: AddSpaceTextField!
    @IBOutlet weak var spaceAddressTF: AddSpaceTextField!
    @IBOutlet weak var EmailTF: AddSpaceTextField!
    @IBOutlet weak var webSiteTF: AddSpaceTextField!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableviewTopConstraint: NSLayoutConstraint!
    
    var space:Space = Space()
    var country    = ["Egypt", "Dubia", "KSA", "Qatar"]
    var government = ["cario" , "Alexandria" , "ismailia" , "Tanta" , "Damnhour"]
    let cellReuseIdentifier = "cell"
    var chooseTablView:Bool?
    
    @IBAction func textFieldChanged(_ sender: AnyObject) {
        tableView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseTablView = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate    = self
        tableView.dataSource  = self
        countryTF.delegate    = self
        governmentTF.delegate = self
        tableView.isHidden = true
        tableView.layer.borderColor = UIColor.blue.cgColor
        tableView.layer.borderWidth = 1
        tableviewTopConstraint.constant = 5
        countryTF.addTarget(self, action: #selector(textFieldCountryActive), for: UIControlEvents.touchDown)
        governmentTF.addTarget(self, action: #selector(textFieldgovermentActive), for: UIControlEvents.touchDown)
    }
    
    override func viewDidLayoutSubviews()
    {
        heightConstraint.constant = tableView.contentSize.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch:UITouch = touches.first else
        {
            return;
        }
        if touch.view != tableView
        {
            if(chooseTablView == true){
                countryTF.endEditing(true)
                tableView.isHidden = true
            }else if(chooseTablView == false){
                governmentTF.endEditing(true)
                tableView.isHidden = true
            }
        }
    }
    
    @objc func textFieldCountryActive() {
        chooseTablView = true
        tableView.isHidden = !tableView.isHidden
    }
    @objc func textFieldgovermentActive() {
        chooseTablView = false
        print(chooseTablView)
        tableView.isHidden = !tableView.isHidden
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("The textField ended editing. Do something based on app requirements.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == countryTF {    
            tableView.isHidden = false
            tableviewTopConstraint.constant = 5
            self.chooseTablView = true
            print(chooseTablView)
        }else if (textField == governmentTF){
            tableView.isHidden = false
            tableviewTopConstraint.constant = 80
            self.chooseTablView = false
            print(chooseTablView)
        }
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == countryTF || textField == governmentTF {
            return false
        }else {
            return true
        }
    }
    
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        guard let spaceName = spaceNameTF.text, !spaceName.isEmpty else{
            self.view.makeToast("enter space Name", duration: 3.0, position: .bottom)
            return
        }
        guard let numberPhone = numberPhoneTF.text, !numberPhone.isEmpty else{
            self.view.makeToast("enter phone number", duration: 3.0, position: .bottom)
            return
        }
        guard let country = countryTF.text, !country.isEmpty else{
            self.view.makeToast("select county", duration: 3.0, position: .bottom)
            return
        }
        guard let government = governmentTF.text, !government.isEmpty else{
            self.view.makeToast("select government", duration: 3.0, position: .bottom)
            return
        }
        guard let spaceAddress = spaceAddressTF.text, !spaceAddress.isEmpty else{
            self.view.makeToast("enter space address", duration: 3.0, position: .bottom)
            return
        }
        
        guard let email = EmailTF.text, !email.isEmpty else{
            self.view.makeToast("enter Email", duration: 3.0, position: .bottom)
            return
        }
        guard Validate.isValidEmail(testStr: email) == true else{
            self.view.makeToast("Enter valid Email", duration: 3.0, position: .bottom)
            return
        }
        guard let website = webSiteTF.text, !website.isEmpty else{
            self.view.makeToast("enter website", duration: 3.0, position: .bottom)
            return
        }

        let secondAddSpaceVc = storyboard?.instantiateViewController(withIdentifier: "AddSpaceSecondScreenViewController") as! AddSpaceSecondScreenViewController
        space.name = spaceName
        space.contacts.append(numberPhone)
        let location = Location()
        location.address = spaceAddress
        location.country = country
        location.government = government
        space.locations.append(location)
        space.email =  email
        space.website = website
        secondAddSpaceVc.space = space
        self.present(secondAddSpaceVc, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddSpaceViewController:UITableViewDelegate , UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount:Int = 0
        if(chooseTablView == true){
            rowCount = country.count
        }else if(chooseTablView == false){
            rowCount = government.count
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        if(chooseTablView == true){
            cell.textLabel?.text = country[indexPath.row]
            cell.textLabel?.font = countryTF.font
        }else if (chooseTablView == false){
            cell.textLabel?.text = government[indexPath.row]
            cell.textLabel?.font = governmentTF.font
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(chooseTablView == true){
            countryTF.text = country[indexPath.row]
            tableView.isHidden = true
            countryTF.endEditing(true)
        }else if(chooseTablView == false){
            governmentTF.text = government[indexPath.row]
            tableView.isHidden = true
            governmentTF.endEditing(true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
 
}


