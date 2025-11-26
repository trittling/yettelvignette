//
//  Result+Utils.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

public extension Result {
    var isFailure: Bool { !isSuccess }
        
    var isSuccess: Bool {
        switch self {
        case .failure: return false
        case .success: return true
        }
    }
    
    var failureError: Failure? {
        switch self {
        case .failure(let error): return error
        case .success: return nil
        }
    }
    
    var successResult: Success? {
        switch self {
        case .failure: return nil
        case .success(let value): return value
        }
    }
}
