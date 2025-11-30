//
//  NavigationDestination.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

enum NavigationDestination: Hashable {
    case annualSelector(order: VignetteOrder)
    case summary(order: VignetteOrder)
    case success
}
