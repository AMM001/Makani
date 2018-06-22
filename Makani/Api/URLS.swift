//
//  URLS.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class URL:NSObject {
    
    static var baseUrl       =  "http://10.0.1.64:8084/MakanyAPI/"
    static var loginUrl      = baseUrl + "user/login"
    static var register      = baseUrl + "user/registeruser"
    static var topRatedSpace = baseUrl + "space/getTopSpaces?"
}

