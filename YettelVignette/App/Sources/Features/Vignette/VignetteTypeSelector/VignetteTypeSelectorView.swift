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
                ScrollView {
                    Color.init(hex: Colors.backgroundColor.rawValue)
                        .ignoresSafeArea()
                    VStack {
                        CarView(plateNumber: viewModel.plateNumber.uppercased(), name: viewModel.name)
                        
                        TypeSelectorView(
                            selectedVignette: Binding<HighwayVignette?>(
                                get: { viewModel.vignetteOrder.selectedVignette },
                                set: { viewModel.vignetteOrder.selectedVignette = $0 }
                            ),
                            higwayVignettes: viewModel.highwayVignettes,
                            onSelect: {
                                if let vignette = viewModel.vignetteOrder.selectedVignette {
                                    viewModel.vignetteOrder.sumPrice = vignette.sum
                                    path.append(NavigationDestination.summary(order: viewModel.vignetteOrder))
                                }
                            }
                        )
                        
                        AnnualView()
                            .padding(.top, 16)
                            .onTapGesture {
                                path.append(NavigationDestination.annualSelector(order: viewModel.vignetteOrder))
                            }
                        
                        Spacer()
                    }
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
                    case .annualSelector(let order):
                        AnnualSelectorView(path: $path, order: order)
                    case .summary(let order):
                        SummaryView(path: $path, order: order)
                    case .success:
                        SuccessView(path: $path)
                    }
                }
                .background(Color.init(hex: Colors.backgroundColor.rawValue))
            }
        }
    }
}



#Preview {
    VignetteTypeSelectorView()
}
