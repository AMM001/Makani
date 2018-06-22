//
//  URLS.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class URLS:NSObject {
    
    static var baseUrl       =  "http://10.10.10.56:8084/MakanyAPI/"
    static var loginUrl      = baseUrl + "user/login"
    static var register      = baseUrl + "user/registeruser"
    static var topRatedSpace = baseUrl + "space/getTopSpaces?"
    static var addSpace = baseUrl + "space/registerspace?ownerId="

}

