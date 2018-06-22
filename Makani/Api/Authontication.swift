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
   static var i = 2
   static var idGenerator = "x\(i)"
    static func login(email:String,password:String,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URL.loginUrl
        
        var interestArray:Array<Any> = []
        let paramaters = ["email":email ,"password":password] as [String : Any]
        Alamofire.request(url, method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure:
                    completion(response.error?.localizedDescription,false)
                case .success:
                    let json = JSON(response.value!)
                   // let status = json["errorDesc"].string
                  //  if status == "Success" {
                  
                    
                      let id          = json["id"].string
                      let name        = json["name"].string
                      let email       = json["email"].string
                      let phone       = json["phone"].string
                      let password    = json["password"].string
                      let country     = json["country"].string
                      let government  = json["government"].string
                      let gender      = json["gender"].string
                      let birthdate   = json["birthdate"].string
                      let job         = json["job"].string
                      let owner       = json["owner"].bool
                      let photo       = json["photo"].string
                      let interests   = json["interests"].array
                    
                    for nameInterest in interests!{
                       let interestName = nameInterest["name"].string
                        
                        interestArray.append(interestName!)
                       print(interestName!)
                    }
                    
                
                    let loggedUser = User(id: id!, name: name!, email: email!, phone: phone!, password: password!, country: country!, government: government!, gender: gender!, birthdate: birthdate!, photo: photo!, job: job!, owner: owner!, interests: interestArray as! Array<String>)
                    
                        completion(nil,loggedUser)
                   // }else{
                       // let errorMessage = json["errorDesc"].string
                       // completion(errorMessage,nil)
                    }
                }
        }
 
    static func RegisterUser(name:String,email:String,password:String,phone:String,country:String,government:String,gender:String,birthdate:String,photo:String ,job:String,intrests:Array<Any>,owner:Bool,skills:Array<Any>,userEvent:Array<Any>,spaces:Array<Any>,events:Array<Any>,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URL.register
        let paramaters = ["id":"asfcfr", "name":name ,"email":email ,"password":password ,"phone":phone,"country":country,"government":government,"gender":gender,"birthdate":birthdate,"photo":photo ,"job":job, "interests":intrests,"owner":owner,"skills":skills,"userEvents":userEvent,"spaces":spaces,"events":events] as [String : Any]
            i = i + 4

        Alamofire.request(url, method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure:
                    completion(response.error?.localizedDescription,false)
                case .success:
                    let json = JSON(response.value!)
                    let status = json["statusCode"].int
                    if status == 1 {
                       //  i = i + 4
                        print(idGenerator)
                        completion(nil,status)
                    }else{
                        let statusMessage = json["statusMessage"].string
                        completion(statusMessage,nil)
                    }
                }
        }
    }

    
}
