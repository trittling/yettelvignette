//
//  VignetteOrder.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 28..
//

import Foundation

struct VignetteOrder {
    var selectedVignettes: [HighwayVignette] = []
    var name: String = ""
    var plateNumber: String = ""
    var highwayVignettes: [HighwayVignette] = []
    var counties: [County] = []
    var price: Int = 0
    var sumPrice = 0
}
