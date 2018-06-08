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

//class Cities {
//
//    let profileID: Int32
//    let coordinates: CLLocationCoordinate2D
//    let country: String
//    let city: String
//
//    init(profileID: Int32, coordinates: CLLocationCoordinate2D, country: String, city: String) {
//        self.profileID = profileID
//        self.coordinates = coordinates
//        self.country = country
//        self.city = city
//    }
//}
//


struct City: Codable, Comparable {
    static func < (lhs: City, rhs: City) -> Bool {
        if lhs._id < rhs._id {
            return false
        }
        if lhs.coord.lat < rhs.coord.lat {
            return false
        }
        if lhs.coord.lon < rhs.coord.lon {
            return false
        }
        if lhs.country < rhs.country {
            return false
        }
        if lhs.name < rhs.name {
            return false
        }
        return true
    }
    
   
    static func == (lhs: City, rhs: City) -> Bool {
        if lhs._id != rhs._id {
            return false
        }
        if lhs.coord.lat != rhs.coord.lat {
            return false
        }
        if lhs.coord.lon != rhs.coord.lon {
            return false
        }
        if lhs.country != rhs.country {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        return true
    }
    
        
        
    

    
    let _id: Int32
    let coord: Coordinate
    let country: String
    let name: String
}

struct Coordinate: Codable {
    let lon: Double
    let lat: Double
}

extension CLLocationCoordinate2D: Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        longitude = try container.decode(Double.self)
        latitude = try container.decode(Double.self)
    }
}

