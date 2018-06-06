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

struct City: Decodable {
    let _id: Int32
    let coord: Coordinate
    let country: String
    let name: String
}

struct Coordinate: Decodable {
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

