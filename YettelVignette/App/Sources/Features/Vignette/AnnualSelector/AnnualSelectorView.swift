//
//  AnnualSelectorView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct AnnualSelectorView: View {
    @Binding var path: NavigationPath
    @State private var isAlertPresented: Bool = false

    @StateObject private var viewModel: AnnualSelectorViewModel
    
    init(path: Binding<NavigationPath>, order: VignetteOrder) {
        _path = path
        _viewModel = StateObject(wrappedValue: AnnualSelectorViewModel(order: order))
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(Constans.Texts.annualTitle.rawValue)
                    .bold()
                    .padding(.top, 24)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                    .titleStlye()
                
                Spacer()
            }
            
            MapView(selectedCounties: $viewModel.selectedCounties)
            
            ScrollView {
                ForEach(viewModel.counties, id: \.self) { county in
                    CheckboxView(title: county.name, price: viewModel.price.formatToHuf(), onSelect: {
                        viewModel.selectVignette(county: county)
                    })
                }
            }
            
            Divider()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            
            AmountView(price: viewModel.sumPrice)
            
            Button(Constans.Texts.next.rawValue, action: {
                if !viewModel.selectedCounties.isEmpty {
                    if viewModel.checkSelectedCounties() {
                        path.append(NavigationDestination.summary(order: viewModel.order))
                    } else {
                        isAlertPresented.toggle()
                    }
                }
            })
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            
            Spacer()
        }
        .alert(Constans.Texts.countyWarningTitle.rawValue, isPresented: $isAlertPresented) {
            Button(Constans.Texts.cancel.rawValue, role: .cancel) { }
            Button(Constans.Texts.ok.rawValue) {
                path.append(NavigationDestination.summary(order: viewModel.order))
            }
        } message: {
            Text(Constans.Texts.countyWarningMessage.rawValue)
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
        .navigationTitle(Constans.Texts.title.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    AnnualSelectorView(path: .constant(NavigationPath()), order: VignetteOrder())
}
