//
//  SATScoreModel.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation

struct SATScoreModel: Codable {
    private let dbn : String
    private let school_name : String
    private let num_of_sat_test_takers : String
    private let sat_critical_reading_avg_score : String
    private let sat_math_avg_score : String
    private let sat_writing_avg_score : String
    
    func returnID() -> String {
        return dbn
    }
    
    func returnMathScore() -> String {
        return self.sat_math_avg_score
    }
    
    func returnReadingScore() -> String {
        return self.sat_critical_reading_avg_score
    }
    
    func returnWritingScore() -> String {
        return sat_writing_avg_score
    }
}

