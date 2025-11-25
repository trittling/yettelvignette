//
//  TitleStyle.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
    }
}

extension View {
    func titleStlye() -> some View {
        self.modifier(TitleStyle())
    }
}
