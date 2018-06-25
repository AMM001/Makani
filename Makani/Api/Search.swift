//
//  Search.swift
//  Makani
//
//  Created by Ahmed Osman on 6/26/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Search: NSObject {
    static func search(keyword:String,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URLS.searchSpace + "\(keyword)"
        print(url)
        var spacesArray = [Space]()
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure:
                    completion(response.error?.localizedDescription,false)
                case .success:
                    let json = JSON(response.value!)
                    let jArray = json.array
                    
                    for spaces in jArray! {
                        
                        let id             = spaces["id"].intValue
                        let email          = spaces["email"].stringValue
                        let name           = spaces["name"].stringValue
                        let openingDays    = spaces["openingDays"].stringValue
                        let openingTime    = spaces["openingTime"].stringValue
                        let closingTime    = spaces["closingTime"].stringValue
                        let overview       = spaces["overview"].stringValue
                        let rating         = spaces["rating"].floatValue
                        let website        = spaces["website"].stringValue
                        let facebook       = spaces["facebook"].stringValue
                        let spacePictures  = spaces["spacePictures"].arrayValue
                        let spaceLocations = spaces["spaceLocations"].arrayValue
                        let roomsArray          = spaces["rooms"].arrayValue
                        let spaceContacts  = spaces["spaceContacts"].arrayValue
                        let spaceFacilities = spaces["facility"]
                        var pictures = Array<String>()
                        var rooms = Array<Room>()
                        var locations = Array<Location>()
                        let location = Location()
                        let room = Room()
                        var contacts = Array<String>()
                        let facilities = Facility()
                        facilities.airConditioner = spaceFacilities["airConditioner"].boolValue
                        facilities.foodDrinks = spaceFacilities["foodDrinks"].boolValue
                        facilities.id = spaceFacilities["id"].intValue
                        facilities.internet = spaceFacilities["internet"].boolValue
                        //                        facilities.internetSpeed =
                        facilities.laptops = spaceFacilities["laptops"].boolValue
                        facilities.projector = spaceFacilities["projector"].boolValue
                        //                        facilities.otherFacilities =
                        for picture in spacePictures{
                            pictures.append(picture["picture"].stringValue)
                        }
                        for locationObject in spaceLocations{
                            location.address = locationObject["address"].stringValue
                            location.atitude = locationObject["atitude"].stringValue
                            location.country = locationObject["country"].stringValue
                            location.government = locationObject["government"].stringValue
                            location.id = locationObject["id"].intValue
                            location.latitude = locationObject["latitude"].stringValue
                            location.longitude = locationObject["longitude"].stringValue
                            locations.append(location)
                        }
                        for picture in spacePictures{
                            pictures.append(picture["picture"].stringValue)
                        }
                        for roomObject in roomsArray{
                            room.capacity = roomObject["capacity"].stringValue
                            room.cost = roomObject["cost"].doubleValue
                            room.id = roomObject["id"].intValue
                            room.name = roomObject["name"].stringValue
                            rooms.append(room)
                        }
                        for contact in spaceContacts{
                            contacts.append(contact["telephone"].stringValue)
                        }
                        spacesArray.append(Space(id: id, email: email, name: name, openingDays: openingDays, openingTime: openingTime, closingTime: closingTime, overview: overview, rating: rating, website: website, facebook: facebook, spacePictures: pictures, loactions: locations, rooms: rooms, contacts: contacts, facilities:facilities))
                    }
                    print(spacesArray)
                    completion(nil , spacesArray)
                    
                    // }else{
                    // let errorMessage = json["errorDesc"].string
                    // completion(errorMessage,nil)
                }
        }
    }
}
