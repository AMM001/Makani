//
//  UserSaving.swift
//  Makani
//
//  Created by mac on 6/21/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

class UserSaving: Object {
    
    @objc dynamic  var name:String?
    @objc dynamic  var email:String?
    @objc dynamic  var phone:String?
    @objc dynamic  var country:String?
    @objc dynamic  var government:String?
    @objc dynamic  var gender:String?
    @objc dynamic  var birthdate:String?
   // @objc  dynamic var interests:Array<String>?
    
    
    
}

