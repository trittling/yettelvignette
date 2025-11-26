//
//  TypeSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct TypeSelectorView: View {
    @Binding private var selectedTitle: String?
    
    let onSelect: () -> Void
    
    init(selectedTitle: Binding<String?>, onSelect: @escaping () -> Void) {
        self.onSelect = onSelect
        self._selectedTitle = selectedTitle
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(Constans.Texts.typeSelectorTitle.rawValue)
                    .bold()
                    .padding(.top, 24)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                    .titleStlye()
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                TypeView(title: "D1 - heti (10 napos)", price: "6 400 Ft", isSelected: selectedTitle == "D1 - heti (10 napos)") {
                    selectedTitle = "D1 - heti (10 napos)"
                }
                TypeView(title: "D1 - havi", price: "10 360 Ft", isSelected: selectedTitle == "D1 - havi") {
                    selectedTitle = "D1 - havi"
                }
                TypeView(title: "D1 - napi (1 napos)", price: "5 150 Ft", isSelected: selectedTitle == "D1 - napi (1 napos)") {
                    selectedTitle = "D1 - napi (1 napos)"
                }
            }
            .padding(.horizontal, 16)
            
            Button(Constans.Texts.buy.rawValue, action: {
                onSelect()
            })
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
    }
}
