//
//  User.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class User: Object,Pool {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var password = ""
    @objc dynamic var email = ""
    @objc dynamic var phone = ""
    @objc dynamic var country = ""
    @objc dynamic var government = ""
    @objc dynamic var gender = ""
    @objc dynamic var birthdate = ""
    @objc dynamic var photo = ""
    @objc dynamic var job = ""
    @objc dynamic var owner = false
    var interests = Array<Interest>()
    var spaces = Array<Space>()
    
    func toJSON() -> [String: Any] {
        
        var interestsJson = Array<[String:Any]>()
        
        for interest in interests{
            interestsJson.append(interest.toJSON())
        }
        
        return [
            "name":name as Any,
            "password":password as Any,
            "email":email as Any,
            "phone":phone as Any,
            "country":country as Any,
            "government":government as Any,
            "gender":gender as Any,
            "birthdate":birthdate as Any,
            "photo":photo as Any,
            "job":job as Any,
            "owner":owner as Any,
            "interests":interestsJson,
            "skills":[],
            "userEvents":[],
            "spaces":[],
            "events":[]
        ]
    }
    
//
//    init(id:Int , name:String , email:String ,password:String ,phone:String, country:String ,government:String ,gender: String ,birthdate:String ,photo :String ,job :String ,owner:Bool ,interests:Array<Interest> )  {
//        super.init()
//        self.id = id
//        self.name = name
//        self.password = password
//        self.phone = phone
//        self.email = email
//        self.country = country
//        self.gender = gender
//        self.government = government
//        self.birthdate = birthdate
//        self.photo = photo
//        self.job = job
//        self.owner = owner
//        self.interests = interests
//    }
//
//    required init(realm: RLMRealm, schema: RLMObjectSchema) {
//        fatalError("init(realm:schema:) has not been implemented")
//    }
//
//    required init(value: Any, schema: RLMSchema) {
//        fatalError("init(value:schema:) has not been implemented")
//    }
//
//    required init() {
//        fatalError("init() has not been implemented")
//    }
}
