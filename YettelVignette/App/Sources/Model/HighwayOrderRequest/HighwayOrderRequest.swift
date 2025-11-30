//
//  OrderRequest.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 30..
//

import Foundation

struct HighwayOrderRequest: Codable {
    let highwayOrders: [HighwayOrder]
}

struct HighwayOrder: Codable {
    let type: String
    let category: String
    let cost: Int
}
