//
//  AddSpaceFourthViewController.swift
//  Makani
//
//  Created by mac on 6/16/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AddSpaceFourthViewController: UIViewController {
    private var objectCach = ObjectCach.getInstance()
    @IBOutlet weak var overview: UITextView!
    var space:Space?
    private var user:User?
    
    @IBAction func submit(_ sender: Any) {
        space?.overview = overview.text
        space?.ownerId = 1
        Addspace.addSpace(space: space!) { (error, result) in
            if error == nil {
                let homeOnwerVc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerOwnerViewController") as! ContainerOwnerViewController
                self.user?.spaces.append(self.space!)
                self.present(homeOnwerVc, animated: true, completion: nil)
            }else{
                self.view.makeToast("Space Adding Failed", duration: 3.0, position: .bottom)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overview.layer.cornerRadius = 5
        overview.layer.borderWidth = 1
        overview.layer.borderColor = UIColor.gray.cgColor
        overview.textColor = .lightGray
        overview.text = "OverView"
        overview.autocapitalizationType = .words
        overview.isScrollEnabled = false
        user = objectCach.lookup(key: "User") as? User
    }
    
    func textViewDidBeginEditing (textView: UITextView) {
        if overview.text == "OverView" && overview.isFirstResponder {
            overview.text = ""
            overview.textColor = .white
        }
    }
    
    func textViewDidEndEditing (textView: UITextView) {
        if overview.text.isEmpty || overview.text == "" {
            overview.textColor = .lightGray
            overview.text = "OverView"
        }
    }
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
