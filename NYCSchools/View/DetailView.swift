//
//  DetailView.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    let school: School
    @StateObject var detailViewModel = DetailViewModel()
    
    init(school: School) {
        self.school = school
    }
    
    // The detail view for the school. Will display the school name, map, SAT scores, along with other infornation.

    var body: some View {
        VStack {
            MapView(coordinate: school.returnCoordinates())
                .frame(height: 300)
            VStack {
                Text(school.returnSchoolName())
                    .font(.system(size: 32))
                Text(school.makeAddress())
            }
            .multilineTextAlignment(.center)
            
            Divider()
            Text("SAT Scores")
                .font(.title)
            
            if self.detailViewModel.hasSAT() {
                HStack {
                    Text("Math")
                    Spacer()
                    Text(detailViewModel.returnSATMath())
                }
                HStack {
                    Text("Reading")
                    Spacer()
                    Text(detailViewModel.returnSATReading())
                }
                HStack {
                    Text("Writing")
                    Spacer()
                    Text(detailViewModel.returnSATWriting())
                }
            } else {
                Text("No SAT info available")
            }
        }
        .padding()
        Spacer()
            .navigationTitle("Details")
        .onAppear() {
            self.detailViewModel.setSchool(school: self.school)
        }
    }
}
