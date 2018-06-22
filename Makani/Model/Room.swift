//
//  Room.swift
//  Makani
//
//  Created by Ahmed Osman on 6/19/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Room: NSObject {
 
     @objc dynamic var id = 0
     @objc dynamic var name = ""
     @objc dynamic var capacity = ""
     @objc dynamic var cost = 0.0

    func toJSON() -> [String: Any] {
        return [
            "name": name as Any,
            "capacity":capacity as Any,
            "cost":cost as Any
        ]
    }
}
