//
//  Authontication.swift
//  Makani
//
//  Created by mac on 6/1/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Authontication:NSObject {
    
    static func login(email:String,password:String,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URL.loginUrl
        let paramaters = ["email":email ,"password":password] as [String : Any]
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
