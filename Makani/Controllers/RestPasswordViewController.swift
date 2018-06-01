//
//  RestPasswordViewController.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class RestPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    

    @IBAction func sendEmailBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
