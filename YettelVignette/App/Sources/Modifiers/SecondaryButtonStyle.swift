//
//  SecondaryButtonStyle.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
            .padding(.horizontal)
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(configuration.isPressed ?
                .clear.opacity(0.7) :
                .clear)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(hex: Colors.primaryTextColor.rawValue), lineWidth: 2)
            )
            
    }
}

