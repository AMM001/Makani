//
//  Freelancer.swift
//  Makani
//
//  Created by Ahmed Osman on 6/22/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Freelancer: NSObject {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var job = ""
    @objc dynamic var costPerHour = ""
    @objc dynamic var overview = ""
    @objc dynamic var availability = ""
    
    
    func toJSON() -> [String: Any] {        
        return [
            "id": id as Any,
            "name": name  as Any,
            "job": job  as Any,
            "availability": availability  as Any,
            "costPerHour": costPerHour  as Any,
            "overview": overview as Any
        ]
    }
}
