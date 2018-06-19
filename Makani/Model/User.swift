//
//  User.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class User: NSObject {

    var id:String?
    var name:String?
    var email:String?
    var phone:String?
    var password:String?
    var country:String?
    var government:String?
    var gender:String?
    var birthdate:String?
    var photo:String?
    var job:String?
    var owner:Bool?
    var interests:Array<String>?
    
    override init(){
        
    }
    
   init(id:String , name:String , email:String , phone:String ,password:String , country:String ,government:String ,gender: String ,birthdate:String ,photo :String ,job :String ,owner:Bool ,interests:Array<String> )  {
        self.id = id
        self.name = name
        self.phone = phone
        self.email = email
        self.password = password
        self.country = country
        self.gender = gender
        self.government = government
        self.birthdate = birthdate
        self.photo = photo
        self.job = job
        self.owner = owner
        self.interests = interests
    }
}
