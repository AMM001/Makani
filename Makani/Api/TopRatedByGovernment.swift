//
//  TopRatedByGovernment.swift
//  Makani
//
//  Created by mac on 6/21/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TopRatedByGovernment:NSObject{
    
    static func topRatedSpace(government:String,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URL.topRatedSpace + "government\(government)"
        var spacesArray = [Space]()
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure:
                    completion(response.error?.localizedDescription,false)
                case .success:
                    let json = JSON(response.value!)
                    let jArray = json.array
                    
                    for spaces in jArray! {
                       
                     let id             = spaces["id"].string
                     let email          = spaces["email"].string
                     let name           = spaces["name"].string
                     let openingDays    = spaces["openingDays"].string
                     let openingTime    = spaces["openingTime"].string
                     let closingTime    = spaces["closingTime"].string
                     let overview       = spaces["overview"].string
                     let rating         = spaces["overview"].float
                     let website        = spaces["website"].string
                     let facebook       = spaces["facebook"].string
                     let spacePictures  = spaces["spacePictures"].array
                     let spaceLocations = spaces["spaceLocations"].array
                     let rooms          = spaces["rooms"].array
                     let spaceContacts  = spaces["spaceContacts"].array
                
                    spacesArray.append(Space(id: id!, email: email!, name: name!, openingDays: openingDays!, openingTime: openingTime!, closingTime: closingTime!, overview: overview!, rating: rating!, website: website!, facebook: facebook!, spacePictures: spacePictures!, loactions: spaceLocations!, rooms: rooms!, contacts: spaceContacts!))
                    }
                    completion(nil , spacesArray)
                    
                    // }else{
                    // let errorMessage = json["errorDesc"].string
                    // completion(errorMessage,nil)
                }
        }
                    
        
        }
    }
    
    
    
    
    
    
    
    
    

