//
//  NetworkCalls.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import Combine

/*
    Despite the NetworkCalls name, due to time constraints I decided to load the JSON locally. This might actually work as I doubt either of the lists will change
 
    Given more time, I would utilize a hash table instead of looping through the SAT results, as constant time is ideal in this scenario.
 */

struct NetworkCalls {
    
    func loadListOfSchools() -> Future<Array<School>, ResponseError> {
        let subject = Future<Array<School>, ResponseError> { completion in
            if let path = Bundle.main.path(forResource: "NYCSchools", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([School].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(ResponseError(type: .badData, message: "Error loading list of schools")))
                }
            } else {
                completion(.failure(ResponseError(type: .fileNotFound, message: "List of schools not found")))
            }
        }
        return subject
    }
    
    func loadSATScoresForSchool(id: String) -> Future<SATScoreModel, ResponseError> {
        var foundScore: Bool = false
        
        let subject = Future<SATScoreModel, ResponseError> { completion in
            if let path = Bundle.main.path(forResource: "SATScores", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([SATScoreModel].self, from: data)
                    for item in result {
                        if item.returnID() == id {
                            completion(.success(item))
                            foundScore = true
                            break
                        }
                    }
                    
                    if !foundScore {
                        completion(.failure(ResponseError(type: .noSAT, message: "No SAT scores are available for this school")))
                    }
                    
                } catch {
                    completion(.failure(ResponseError(type: .badData, message: "Error loading SAT scores")))
                }
            } else {
                completion(.failure(ResponseError(type: .fileNotFound, message: "SAT scores file not found")))
            }
        }
        return subject
    }
}
