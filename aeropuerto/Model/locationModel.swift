//
//  locationModel.swift
//  aeropuerto
//
//  Created by Jesus Grimaldo on 24/09/22.
//

import Foundation
import MapKit

class locationModel: Codable, Identifiable {
    let iataCode, icaoCode, name, alpha2CountryCode: String
    let latitude, longitude: Double
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    enum CodingKeys: String, CodingKey {
        case iataCode, icaoCode, name
        case alpha2CountryCode = "alpha2countryCode"
        case latitude, longitude
        
    }
}
