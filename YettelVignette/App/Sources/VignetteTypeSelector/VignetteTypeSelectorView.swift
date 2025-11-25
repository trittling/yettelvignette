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

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.init(hex: Colors.backgroundColor.rawValue)
                    .ignoresSafeArea()
                VStack {
                    CarView(plateNumber: "ABC 124", name: "Michael Scott")
                    
                    TypeSelectorView() {
                        path.append(Constans.Navigation.summary.rawValue)
                    }
                    
                    AnnualView()
                        .padding(.top, 16)
                        .onTapGesture {
                            path.append(Constans.Navigation.annualSelector.rawValue)
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
            .navigationDestination(for: String.self) { value in
                if value == Constans.Navigation.annualSelector.rawValue {
                    AnnualSelectorView(path: $path)
                } else if value == Constans.Navigation.summary.rawValue {
                    SummaryView(path: $path)
                } else if value == Constans.Navigation.success.rawValue {
                    SuccessView(path: $path)
                }
            }
        }
    }
}



#Preview {
    VignetteTypeSelectorView()
}
