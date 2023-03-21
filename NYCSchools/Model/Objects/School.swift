//
//  School.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import CoreLocation

struct School : Codable {
    
    private let dbn : String
    private let school_name : String
    private let primary_address_line_1 : String
    private let city : String
    private let zip : String
    private let state_code : String
    // As not all schools have coordinates, these must be optional
    private let latitude : String?
    private let longitude : String?
    
    init(dbn: String, school_name: String, primary_address_line_1: String, city: String, zip: String, state_code: String, latitude: String?, longitude: String?) {
        self.dbn = dbn
        self.school_name = school_name
        self.primary_address_line_1 = primary_address_line_1
        self.city = city
        self.zip = zip
        self.state_code = state_code
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // In all cases, we'll default to an empty string if it's nil
    func returnSchoolName() -> String {
        return self.school_name
    }
    
    func returnCoordinates() -> CLLocationCoordinate2D {
        // Defaults to Manhattan if no coordinates are given
        let lat = Double(self.latitude ?? "40.7831")
        let lon = Double(self.longitude ?? "-73.9712")
        // At this point lat and lon will not be nil, so it's safe to force unwrap it
        let coordinates = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        return coordinates
    }
    
    // It gives me a compiler error if it's not broken up into 2 parts
    func makeAddress() -> String {
        let readableAddress = (self.primary_address_line_1) + ", " + (self.city) + ", "
        let ra2 = readableAddress + (self.state_code) + ", " + (self.zip)
        return ra2
    }
    
    func returnID() -> String {
        return dbn 
    }
}

extension School: Identifiable {
    var id: String { return dbn }
}

