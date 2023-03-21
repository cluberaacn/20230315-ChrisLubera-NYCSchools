//
//  DetailViewModel.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import CoreLocation
import Combine

let networkCalls = NetworkCalls()

class DetailViewModel: ObservableObject {
    
    @Published private var school: School?
    @Published private var SAT: SATScoreModel?
    private var cancellables = Set<AnyCancellable>()
    
    func setSchool(school: School) {
        self.school = school
        getSAT(school: school)
    }
    
    func schoolName() -> String {
        return school?.returnSchoolName() ?? "Error"
    }
    
    func schoolAddress() -> String {
        return school?.makeAddress() ?? "Error"
    }
    
    func schoolCoordinates() -> CLLocationCoordinate2D {
        return school?.returnCoordinates() ?? CLLocationCoordinate2D(latitude: 40.7831, longitude: -73.9712)
    }
    
    func getSAT(school: School) {
        networkCalls.loadSATScoresForSchool(id: school.returnID())
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.message)
                case .finished:
                    break
                }
            } receiveValue: {value in
                self.SAT = value
            }
            .store(in: &cancellables)
    }
    
    func hasSAT() -> Bool {
        if (self.SAT != nil) {
            return true
        }
        return false
    }
    
    
    // These methods should never be called if STA is nil, however we will return "Error" just in case it is nil
    func returnSATMath() -> String {
        return SAT?.returnMathScore() ?? "Error"
    }
    
    func returnSATReading() -> String {
        return SAT?.returnReadingScore() ?? "Error"
    }
    
    func returnSATWriting() -> String {
        return SAT?.returnWritingScore() ?? "Error"
    }
}
