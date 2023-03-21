//
//  MapView.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import SwiftUI

import MapKit


struct MapView: View {

    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    // Displays the map of the location of the school
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 40.73653, longitude: -73.9927))
    }
}
