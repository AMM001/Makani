//
//  File.swift
//  Makani
//
//  Created by mac on 6/4/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector("statusBar")) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}


