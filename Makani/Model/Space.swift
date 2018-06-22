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
    @objc dynamic var rating:Float = 0.0
    @objc dynamic var website = ""
    @objc dynamic var facebook = ""
    @objc dynamic var ownerId = 0
    var facilities = Facility()
    var pictures = Array<String>()
    var locations = Array<Location>()
    var rooms = Array<Room>()
    var contacts = Array<String>()
    var freelancers = Array<Freelancer>()
    
    override init() {
        
    }
    
    init(id:Int , email:String , name:String , openingDays:String , openingTime:String , closingTime:String ,overview:String , rating:Float, website:String ,facebook:String ,spacePictures:Array<String>,
         loactions:Array<Location> , rooms:Array<Room> , contacts:Array<String>, facilities:Facility){
        self.id = id
        self.email = email
        self.name = name
        self.openingDays = openingDays
        self.openingTime = openingTime
        self.closingTime = closingTime
        self.overview = overview
        self.rating = rating
        self.website = website
        self.facebook = facebook
        self.pictures = spacePictures
        self.locations = loactions
        self.rooms = rooms
        self.contacts = contacts
        self.facilities = facilities
    }
        
    func toJSON() -> [String: Any] {
        
        var picturesJson = Array<[String:Any]>()
        var freelancersJson = Array<[String:Any]>()
        var contactsJson = Array<[String:Any]>()
        var locationsJson = Array<[String:Any]>()
        var roomsJson = Array<[String:Any]>()
        let facilitiesJson = facilities.toJSON()
        
        for picture in pictures {
            picturesJson.append(["picture":picture as Any])
        }
        
        for location in locations {
            locationsJson.append(location.toJSON())
        }
        
        for room in rooms {
            roomsJson.append(room.toJSON())
        }
        
        for contact in contacts {
            contactsJson.append(["telephone":contact as Any])
        }
        
        for freelancer in freelancers {
            freelancersJson.append(freelancer.toJSON())
        }
        
        return [
            "email": email as Any,
            "name": name as Any,
            "openingTime": openingTime as Any,
            "closingTime": closingTime as Any,
            "overview": overview as Any,
            "rating": rating as Any,
            "website": website as Any,
            "facebook": facebook as Any,
            "facility": facilitiesJson,
            "spacePictures": picturesJson,
            "spaceLocations": locationsJson,
            "rooms": roomsJson,
            "spaceContacts": contactsJson,
            "freelancers": freelancersJson
        ]
    }
    
}

