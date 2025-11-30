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
    @Injected private var vignetteInteractor: VignetteInteractorType
    
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
        if let vignetteOrder = order.selectedVignette,
           let type = Constans.VignetteType(rawValue: vignetteOrder.vignetteType.first ?? "") {
            return type.detailName
        }
        return Constans.VignetteType.year.detailName
    }
    
    func getVignetteTypePrice() -> Int {
        if let vignetteOrder = order.selectedVignette,
           let _ = Constans.VignetteType(rawValue: vignetteOrder.vignetteType.first ?? "") {
            return vignetteOrder.sum
        }
        return 0
    }
    
    func getVignetteTypeTitle() -> String {
        if let vignetteOrder = order.selectedVignette,
           let type = Constans.VignetteType(rawValue: vignetteOrder.vignetteType.first ?? "") {
            return type.displayName
        }
        return ""
    }
    
    func createVignetteOrderRequest(completion: (() -> Void)? = nil) async {
        if let selectedVidget = order.selectedVignette {
            let highwayOrder = HighwayOrder(type: selectedVidget.vignetteType.first!,
                                            category: selectedVidget.vehicleCategory,
                                            cost: selectedVidget.sum)
            var highwayOrders: [HighwayOrder] = []
            highwayOrders.append(highwayOrder)
            let request = HighwayOrderRequest(highwayOrders: highwayOrders)
            let result = await vignetteInteractor.postOrder(orderRequest: request)
            if result.successResult != nil {
                completion?()
            }
        } else {
            if !order.selectedCounties.isEmpty {
                var highwayOrders: [HighwayOrder] = []
                let highwayVignettes = order.highwayVignettes
                for highwayVignette in highwayVignettes {
                    if highwayVignette.vignetteType.count > 1 {
                        for county in order.selectedCounties {
                            if highwayVignette.vignetteType.contains(county.id) {
                                let highwayOrder = HighwayOrder(type: county.id,
                                                                category: highwayVignette.vehicleCategory,
                                                                cost: highwayVignette.sum)
                                highwayOrders.append(highwayOrder)
                                let request = HighwayOrderRequest(highwayOrders: highwayOrders)
                                let result = await vignetteInteractor.postOrder(orderRequest: request)
                                if result.successResult != nil {
                                    completion?()
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}
