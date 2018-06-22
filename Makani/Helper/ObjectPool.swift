//
//  ObjectPool.swift
//  Makani
//
//  Created by mac on 6/22/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation


class ObjectPool {
    var objects = Array<[String:pool]>()
    
    private init(){
        
    }
    
    static let objectPool = ObjectPool()
    
    func lookup(name:String) -> pool?{
        for object in objects{
            if object[name] != nil{
                return object[name]!
            }
        }
        return nil
    }
    
    func addPool(name:String,object:pool){
        objects.append([name:object])
    }
    
    static func getInstance() -> ObjectPool{
        return objectPool
    }
}



