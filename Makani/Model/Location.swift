//
//  Location.swift
//  Makani
//
//  Created by Ahmed Osman on 6/19/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Location: NSObject {
        
    @objc dynamic var id = 0
    @objc dynamic var country = ""
    @objc dynamic var government = ""
    @objc dynamic var address = ""
    @objc dynamic var longitude = ""
    @objc dynamic var latitude = ""
    @objc dynamic var atitude = ""
    
    func toJSON() -> [String: Any] {
        return [
            "country": country as Any,
            "government":government as Any,
            "address":address as Any,
            "longitude":longitude as Any,
            "latitude":latitude as Any,
            "atitude":atitude as Any,
        ]
    }
}
