//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by christopher.lubera on 3/15/23.
//

import XCTest
import CoreLocation
@testable import NYCSchools

// Here's a few tests to demonstrate unit testing, given more time I'd create a lot more

final class NYCSchoolsTests: XCTestCase {
    
    let fakeSchool = School(dbn: "123", school_name: "Fake school with Lat and Lon", primary_address_line_1: "500 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: "41.8822", longitude: "-87.6402")
    
    let fakeSchoolNoLatAndLon = School(dbn: "456", school_name: "Fake school with no Lat and Lon", primary_address_line_1: "500 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: nil, longitude: nil)

    func testReturnCoordinatesWhenSchoolHasCoordinates() throws {
        XCTAssertTrue(fakeSchool.returnCoordinates().latitude == 41.8822)
    }
    
    func testReturnCoordinatesWhenSchoolHasNoCoordinates() throws {
        XCTAssertTrue(fakeSchoolNoLatAndLon.returnCoordinates().latitude == 40.7831)
    }
}
