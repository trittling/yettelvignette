//
//  PrimaryButtonStyle.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(configuration.isPressed ?
                        Color(hex: Colors.primaryTextColor.rawValue).opacity(0.7) :
                        Color(hex: Colors.primaryTextColor.rawValue))
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
