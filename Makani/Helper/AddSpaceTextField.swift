//
//  AddSpaceTextField.swift
//  Makani
//
//  Created by mac on 6/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AddSpaceTextField: UITextField {
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createBorder()
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
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.select(_:)) || action == #selector(UIResponderStandardEditActions.selectAll(_:)){
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    

}
