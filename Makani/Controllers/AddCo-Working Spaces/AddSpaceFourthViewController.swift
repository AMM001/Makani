//
//  AddSpaceFourthViewController.swift
//  Makani
//
//  Created by mac on 6/16/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AddSpaceFourthViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
   
    var space:Space?

    @IBAction func submit(_ sender: Any) {
        Addspace.addSpace(space: space!) { (error, result) in
            if error == nil {
                self.view.makeToast("Space Added Successfuly", duration: 3.0, position: .bottom)
            }else{
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textview.layer.cornerRadius = 5
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.gray.cgColor
        
        textview.textColor = .lightGray
        textview.text = "OverView"
        
        textview.autocapitalizationType = .words
        textview.isScrollEnabled = false

    
    }
    
    func textViewDidBeginEditing (textView: UITextView) {
        if textview.text == "OverView" && textview.isFirstResponder {
            textview.text = ""
            textview.textColor = .white
        }
    }
    
    func textViewDidEndEditing (textView: UITextView) {
        if textview.text.isEmpty || textview.text == "" {
            textview.textColor = .lightGray
            textview.text = "OverView"
        }
    }
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func previousBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    

}
