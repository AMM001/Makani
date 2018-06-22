//
//  Space.swift
//  Makani
//
//  Created by Ahmed Osman on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Space: NSObject {
    
    var id:String?
    var email:String?
    var name:String?
    var openingDays:String?
    var openingTime:String?
    var closingTime:String?
    var overview:String?
    var rating:Float?
    var website:String?
    var facebook:String?
    var spacePictures:Array<Any>?
    var locations:Array<Any>?
    var rooms:Array<Any>?
    var contacts:Array<Any>?
    
    override init() {
        
    }
    
    init(id:String , email:String , name:String , openingDays:String , openingTime:String , closingTime:String ,overview:String , rating:Float, website:String ,facebook:String ,spacePictures:Array<Any> ,
         loactions:Array<Any> , rooms:Array<Any> , contacts:Array<Any>){
        
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
        self.spacePictures = spacePictures
        self.locations = loactions
        self.rooms = rooms
        self.contacts = contacts
        
        
        
    }
    
  
    

    
    

}
