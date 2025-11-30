//
//  OrderResponse.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 30..
//

import Foundation

struct ReceivedOrder: Codable {
    let type: String
    let category: String
    let cost: Int
}

struct OrderResponse: Codable {
    let statusCode: String
    let receivedOrders: [ReceivedOrder]
}
