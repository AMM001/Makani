//
//  LocationAnnoutation.swift
//  Makani
//
//  Created by Ahmed Osman on 6/19/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import MapKit

class LocationAnnoutation: NSObject, MKAnnotation{
        let title: String?
        let locationName: String
        let coordinate: CLLocationCoordinate2D
        
        init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.locationName = locationName
            self.coordinate = coordinate            
            super.init()
        }
        
        var subtitle: String? {
            return locationName
        }
    
}
