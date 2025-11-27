//
//  NavigationDestination.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

enum NavigationDestination: Hashable {
    case annualSelector(counties: [County], price: Int)
    case summary(counties: [County], price: Int, sumPrice: Int)
    case success
}
