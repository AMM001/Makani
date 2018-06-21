//
//  User.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class User: NSObject {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
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
    
    func toJSON() -> [String: Any] {
        
        var interestsJson = Array<[String:Any]>()
        
        for interest in interests{
            interestsJson.append(interest.toJSON())
        }
        
        return [
            "name":name as Any,
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
            "skills":[]
        ]
    }
}
