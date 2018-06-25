//
//  ObjectCaching.swift
//  ObjectPoolDemo
//
//  Created by Ahmed Osman on 6/24/18.
//  Copyright © 2018 Ahmed Osman. All rights reserved.
//

import UIKit
import Foundation

class ObjectCach {
    static let objectCach = ObjectCach()
    private var objects = [String:Pool]()
    
    private init(){
        
    }
    
    static func getInstance() -> ObjectCach{
        return objectCach
    }
    
    func lookup(key:String) -> Pool{
        var pool:Pool?
        if objects.contains(where: { (name, value) -> Bool in
            name == key
        }){
            print("Found")
            pool = objects[key]
            return pool!
        }else{
            print("New")
            /// get namespace
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
            let Class: AnyClass = NSClassFromString("\(namespace).\(key)")!
            let objectType : NSObject.Type = Class as! NSObject.Type
            let pool:Pool = objectType.init() as! Pool
            objects[key] = pool
            return pool
        }
    }
}
