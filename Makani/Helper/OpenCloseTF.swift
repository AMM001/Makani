//
//  OpenCloseTF.swift
//  Makani
//
//  Created by mac on 6/14/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class OpenCloseTF: UITextField {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createBorder()
        setimage()
    }
    
    func setimage(){
    
    let imageView = UIImageView()
    
    let image = UIImage(named: "time icon")
    
    imageView.image = image
    imageView.frame = CGRect(x:0, y: 0, width: 50, height: 15)
    imageView.contentMode = .scaleAspectFit
    self.rightViewMode = UITextFieldViewMode.always
    self.rightView = imageView
    self.addSubview(imageView)
    }
    
    func createBorder(){
        
        let myColor : UIColor = UIColor.darkGray
        self.layer.borderWidth = 1
        self.layer.borderColor = myColor.cgColor
        self.layer.cornerRadius = 5
        
    }
    
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    

}
