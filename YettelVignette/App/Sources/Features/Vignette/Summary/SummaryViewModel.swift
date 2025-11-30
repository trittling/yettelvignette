//
//  SummaryViewModel.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation
import Combine

@MainActor
final class SummaryViewModel: ObservableObject {
    @Published var counties = [County]()
    
    var price: Int
    var selectedCounties = [County]()
    var sumPrice: Int
    var order: VignetteOrder
    
    var convenienceFee = 110
    
    init(order: VignetteOrder) {
        self.counties = order.counties
        self.price = order.price
        self.sumPrice = order.sumPrice
        self.order = order
    }
    
    func getVignetteTypeName() -> String {
        if let vignetteOrder = order.selectedVignette {
            if vignetteOrder.vignetteType.first == "WEEK" {
                return "Heti"
            } else if vignetteOrder.vignetteType.first == "MONTH" {
                return "Havi"
            } else if vignetteOrder.vignetteType.first == "DAY" {
                return "Napi"
            } else if vignetteOrder.vignetteType.first == "YEAR" {
                return "Éves"
            }
        }
        return ""
    }
    
    func getVignetteTypePrice() -> Int {
        if let vignetteOrder = order.selectedVignette {
            if vignetteOrder.vignetteType.first == "WEEK" {
                return vignetteOrder.sum
            } else if vignetteOrder.vignetteType.first == "MONTH" {
                return vignetteOrder.sum
            } else if vignetteOrder.vignetteType.first == "DAY" {
                return vignetteOrder.sum
            } else if vignetteOrder.vignetteType.first == "YEAR" {
                return vignetteOrder.sum
            }
        }
        return 0
    }
    
    func getVignetteTypeTitle() -> String {
        if let vignetteOrder = order.selectedVignette {
            if vignetteOrder.vignetteType.first == "WEEK" {
                return "D1 - heti (10 napos)"
            } else if vignetteOrder.vignetteType.first == "MONTH" {
                return "D1 - havi"
            } else if vignetteOrder.vignetteType.first == "DAY" {
                return "D1 - napi (1 napos)"
            } else if vignetteOrder.vignetteType.first == "YEAR" {
                return "D1 - éves"
            }
        }
        return ""
    }
}
