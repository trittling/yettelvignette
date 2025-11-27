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
    let higwayVignettes: [HighwayVignette]
    
    init(selectedTitle: Binding<String?>, higwayVignettes: [HighwayVignette], onSelect: @escaping () -> Void) {
        self.onSelect = onSelect
        self.higwayVignettes = higwayVignettes
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
                ForEach(higwayVignettes, id: \.self) { item in
                    if let type = item.vignetteType.first {
                        if type == "DAY" {
                            TypeView(title: "D1 - napi (1 napos)", price: item.sum.formatToHuf(), isSelected: selectedTitle == "D1 - napi (1 napos)") {
                                selectedTitle = "D1 - napi (1 napos)"
                            }
                        } else if type == "WEEK" {
                            TypeView(title: "D1 - heti (10 napos)", price: item.sum.formatToHuf(), isSelected: selectedTitle == "D1 - heti (10 napos)") {
                                selectedTitle = "D1 - heti (10 napos)"
                            }
                        } else if type == "MONTH" {
                            TypeView(title: "D1 - havi", price: item.sum.formatToHuf(), isSelected: selectedTitle == "D1 - havi") {
                                selectedTitle = "D1 - havi"
                            }
                        } else if type == "YEAR" {
                            TypeView(title: "D1 - éves", price: item.sum.formatToHuf(), isSelected: selectedTitle == "D1 - évi") {
                                selectedTitle = "D1 - évi"
                            }
                        }
                    }
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
