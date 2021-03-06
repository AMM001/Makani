//
//  SelectFacilitiesViewController.swift
//  Makani
//
//  Created by mac on 6/16/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class SelectFacilitiesViewController: UIViewController {

    class ChangeImage: UIButton {
        // Images
        let checkedImage = UIImage(named: "Select shape")!  as UIImage
        let uncheckedImage = UIImage(named: "select shape photo")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setBackgroundImage(checkedImage, for: UIControlState.normal)
                } else {
                    self.setBackgroundImage(uncheckedImage, for: UIControlState.normal)
                    
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
        }
        
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    

    }
}
