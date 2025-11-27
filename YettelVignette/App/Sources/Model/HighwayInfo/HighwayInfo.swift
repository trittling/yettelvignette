//
//  HighwayInfo.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

struct HighwayInfo: Codable {
    let highwayVignettes: [HighwayVignette]
    let vehicleCategories: [VehicleCategory]
    let counties: [County]
    let requestId: String
    let statusCode: String
    let dataType: String

    enum CodingKeys: String, CodingKey {
        case highwayVignettes
        case vehicleCategories
        case counties
        case requestId
        case statusCode
        case dataType
    }
}

struct HighwayVignette: Codable, Hashable {
    let vignetteType: [String]
    let vehicleCategory: String
    let cost: Int
    let trxFee: Int
    let sum: Int
}

struct VehicleCategory: Codable {
    let category: String
    let vignetteCategory: String
    let name: VehicleName
}

struct VehicleName: Codable {
    let hu: String
    let en: String
}

struct County: Codable, Hashable {
    let id: String
    let name: String
}
