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
        let url = URLS.loginUrl
        
        var interestArray:Array<Interest> = []
        var spaceArray:Array<Space> = []
        
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
                    let id     =  json["id"].intValue
                    let name   = json["name"].stringValue
                    let email  = json["email"].stringValue
                    let phone   = json["phone"].stringValue
                    let password   = json["password"].stringValue
                    let country   = json["country"].stringValue
                    let government   = json["government"].stringValue
                    let gender   = json["gender"].stringValue
                    let birthdate   = json["birthdate"].stringValue
                    let job = json["job"].stringValue
                    let owner   = json["owner"].boolValue
                    let photo   = json["photo"].stringValue
                    let interests   = json["interests"].arrayValue
                    let spacesArray = json["spaces"].arrayValue
                    
                    for spaces in spacesArray {
                        
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
                        spaceArray.append(Space(id: id, email: email, name: name, openingDays: openingDays, openingTime: openingTime, closingTime: closingTime, overview: overview, rating: rating, website: website, facebook: facebook, spacePictures: pictures, loactions: locations, rooms: rooms, contacts: contacts, facilities:facilities))
                    }
                    
                    for interestObject in interests{
                        let interest = Interest()
                        interest.name = interestObject["name"].stringValue
                        interest.id = interestObject["id"].intValue
                        interestArray.append(interest)
                    }

                    let loggedUser = User()
//                        id:id, name: name, email: email, password: password, phone: phone, country: country, government: government, gender: gender, birthdate: birthdate, photo: photo, job: job, owner: owner, interests: interestArray as Array<Interest>)
                    loggedUser.id = id
                    loggedUser.name = name
                    loggedUser.email = email
                    loggedUser.password = password
                    loggedUser.phone = phone
                    loggedUser.country = country
                    loggedUser.government = government
                    loggedUser.gender = gender
                    loggedUser.birthdate = birthdate
                    loggedUser.photo = photo
                    loggedUser.job = job
                    loggedUser.owner = owner
                    loggedUser.interests = interestArray
                    loggedUser.spaces = spaceArray
                    completion(nil,loggedUser)
                    print(loggedUser)
                    // }else{
                    // let errorMessage = json["errorDesc"].string
                    // completion(errorMessage,nil)
                }
        }
    }
    
    static func RegisterUser(user:User ,completion:@escaping (_ error:String?,_ result:Any?)->Void){
        let url = URLS.register
        let paramaters = user.toJSON()
        print(user.toJSON())
            Alamofire.request(url, method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: nil)
                .responseJSON { response in
                    switch response.result{
                    case .failure:
                        completion(response.error?.localizedDescription,false)
                    case .success:
                        let json = JSON(response.value!)
                        print(json)
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
