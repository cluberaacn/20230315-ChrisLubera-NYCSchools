//
//  ResponseError.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import Foundation

struct ResponseError: Error {
    let type: ErrorCodes
    let message: String
}

enum ErrorCodes {
    case noSAT
    case badData
    case fileNotFound
}
