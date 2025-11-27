//
//  ContentView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

struct VignetteTypeSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var path = NavigationPath()
    
    @StateObject private var viewModel = VignetteTypeSelectorViewModel()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.init(hex: Colors.backgroundColor.rawValue)
                    .ignoresSafeArea()
                VStack {
                    CarView(plateNumber: viewModel.plateNumber.uppercased(), name: viewModel.name)
                    
                    TypeSelectorView(
                        selectedTitle: Binding<String?>(
                            get: { viewModel.selectedTitle.isEmpty ? nil : viewModel.selectedTitle },
                            set: { viewModel.selectedTitle = $0 ?? "" }
                        ), higwayVignettes: viewModel.highwayVignettes,
                        onSelect: {
                            if !viewModel.selectedTitle.isEmpty {
                                //path.append(Constans.Navigation.summary.rawValue)
                            }
                        }
                    )
                    
                    AnnualView()
                        .padding(.top, 16)
                        .onTapGesture {
                            path.append(NavigationDestination.annualSelector(counties: viewModel.counties,
                                                                             price: viewModel.annualFee))
                        }
                    
                    Spacer()
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .navigationTitle(Constans.Texts.title.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                        }
                    }
                }
            }
            .task {
                await viewModel.getData()
            }
            .navigationDestination(for: NavigationDestination.self) { value in
                switch value {
                case .annualSelector(let counties, let price):
                    AnnualSelectorView(path: $path, counties: counties, price: price)
                case .summary(let selectedCounties, let price, let sumPrice):
                    SummaryView(path: $path, counties: selectedCounties, price: price, sumPrice: sumPrice)
                case .success:
                    SuccessView(path: $path)
                }
            }
        }
    }
}



#Preview {
    VignetteTypeSelectorView()
}
