//
//  Facility.swift
//  Makani
//
//  Created by Ahmed Osman on 6/19/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Facility: NSObject {
    
    @objc dynamic var id = 0
    @objc dynamic var projector = false
    @objc dynamic var laptops = false
    @objc dynamic var airConditioner = false
    @objc dynamic var internet = false
    @objc dynamic var internetSpeed = 0.0
    @objc dynamic var foodDrinks = false
    @objc dynamic var otherFacilities = ""
    
    func toJSON() -> [String: Any] {
        return [
            "projector": projector as Any,
            "laptops":laptops as Any,
            "airConditioner":airConditioner as Any,
            "internet":internet as Any,
            "internetSpeed":internetSpeed as Any,
            "foodDrinks":foodDrinks as Any,
            "otherFacilities":otherFacilities as Any
        ]
    }
}
