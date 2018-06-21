//
//  Space.swift
//  Makani
//
//  Created by Ahmed Osman on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit


class Space: NSObject {    
    
    @objc dynamic var id = 0
    @objc dynamic var email = ""
    @objc dynamic var name = ""
    @objc dynamic var openingDays = ""
    @objc dynamic var openingTime = ""
    @objc dynamic var closingTime = ""
    @objc dynamic var overview = ""
    @objc dynamic var rating = ""
    @objc dynamic var website = ""
    @objc dynamic var facebook = ""
    @objc dynamic var ownerId = ""
    var facilities = Facility()
    var pictures = Array<String>()
    var locations = Array<Location>()
    var rooms = Array<Room>()
    var contacts = Array<String>()
    
    func toJSON() -> [String: Any] {
        
        var picJson = [String:Any]()
        var contactJson = [String:Any]()
        var locJson = Array<[String:Any]>()
        var roomJson = Array<[String:Any]>()
        
        for pic in pictures{
            picJson["picture"] = pic as Any
        }
        
        for loc in locations{
            locJson.append(loc.toJSON())
        }
        
        for room in rooms {
            roomJson.append(room.toJSON())
        }
        
        for contact in contacts{
            contactJson["telephone"] = contact as Any
        }
        
        return [
            "email": email as Any,
            "name": name as Any,
            "openingTime": openingDays as Any,
            "closingTime": closingTime as Any,
            "overview": overview as Any,
            "rating": rating as Any,
            "website": website as Any,
            "facebook": facebook as Any,
            "facility": facilities.toJSON,
            "spacePictures": picJson,
            "spaceLocations": locJson,
            "rooms": roomJson,
            "spaceContacts": contactJson,
            "freelancers": [
                //                [
                //                                "id": "2",
                //                                "name": "Ahmed",
                //                                "job": "iOS developer",
                //                                "availability": "avilable",
                //                                "costPerHour": 50,
                //                                "overview": "Talented iOS developer"
                //                ]
            ]
        ]
    }
}

