//
//  VehicleInfo.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

struct VehicleInfo: Codable {
    let statusCode: String
    let internationalRegistrationCode: String
    let type: String
    let name: String
    let plate: String
    let country: Country
    let vignetteType: String

    struct Country: Codable {
        let hu: String
        let en: String
    }
}
