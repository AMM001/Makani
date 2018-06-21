//
//  Interest.swift
//  Makani
//
//  Created by Ahmed Osman on 6/21/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Interest: NSObject {

    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    func toJSON() -> [String: Any] {
        return [
            "id":id as Any,
            "name": name as Any
        ]
    }
}
