//
//  ListViewModel.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation
import Combine

class ListViewModel {
    
    private let networkCalls = NetworkCalls()
    private var cancellables = Set<AnyCancellable>()
    
    // Given more time, I would make the error handling a bit more robust, possibly with an Alert that displays the error message
    
    func listOfSchools() -> Array<School> {
        var listOfSchools: Array<School>  = []
        networkCalls.loadListOfSchools()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.message)
                case .finished:
                    break
                }
            } receiveValue: {value in
                listOfSchools = value
            }
            .store(in: &cancellables)
        
        return listOfSchools
    }
    
}
