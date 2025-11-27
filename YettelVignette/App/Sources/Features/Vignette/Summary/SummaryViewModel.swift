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
    
    var convenienceFee = 110
    
    init(counties: [County], price: Int, sumPrice: Int) {
        self.counties = counties
        self.price = price
        self.sumPrice = sumPrice
    }
}
