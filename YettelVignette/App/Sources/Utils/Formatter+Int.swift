//
//  Formatter.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation


extension Int {
    func formatToHuf() -> String {
        let amount = Int(self)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.locale = Locale(identifier: "hu_HU")
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: amount)) {
            return "\(formattedNumber) Ft"
        } else {
            return ""
        }
    }
}
