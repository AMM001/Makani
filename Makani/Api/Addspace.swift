//
//  Addspace.swift
//  Makani
//
//  Created by Ahmed Osman on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Addspace: NSObject {
    
    static func addSpace(space:Space,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URLS.addSpace + String(space.ownerId)
        let paramaters = space.toJSON()
        Alamofire.request(url, method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure:
                    completion(response.error?.localizedDescription,false)
                case .success:
                    let json = JSON(response.value!)
                    let status = json["errorDesc"].string
                    if status == "Success" {
                        let loggedUser = User()
                        completion(nil,loggedUser)
                    }else{
                        let errorMessage = json["errorDesc"].string
                        completion(errorMessage,nil)
                    }
                }
        }
    }
}
