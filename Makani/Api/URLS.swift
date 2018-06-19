//
//  URLS.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class URL:NSObject {
    
    static var baseUrl  =  "http://192.168.1.25:8084/MakanyAPI/"
    static var loginUrl = baseUrl + "user/login"
    static var register = baseUrl + "user/registeruser"
    
}
