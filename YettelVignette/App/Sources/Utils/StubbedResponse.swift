//
//  StubbedResponse.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

public func stubbedResponse(_ fileName: String) -> Data {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
       let data = try? Data(contentsOf: url) else {
           return Data()
    }

    return data
}

public func decodeDataToObject<T: Codable>(data: Data?) -> T? {
    let codingPathString = "codingPath:"

    if let dt = data {
        do {
            return try JSONDecoder().decode(T.self, from: dt)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print(codingPathString, context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print(codingPathString, context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print(codingPathString, context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
    return nil
}
