//
//  Validate.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

class Validate: NSObject {
    
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func showAlert(withTitle:String, message:String, viewController:UIViewController) {
        let alertController = UIAlertController(title: withTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let subview = (alertController.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.backgroundColor = UIColor(red: (86/255.0), green: (204/255.0), blue: (242/255.0), alpha: 1.0)
        
        alertController.view.tintColor = UIColor.white
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
}
