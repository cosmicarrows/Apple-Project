//
//  Cities.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/6/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Cities {
    
    let profileID: Int32
    let coordinates: CLLocationCoordinate2D
    let country: String
    let city: String
    
    init(profileID: Int32, coordinates: CLLocationCoordinate2D, country: String, city: String) {
        self.profileID = profileID
        self.coordinates = coordinates
        self.country = country
        self.city = city
    }
}
