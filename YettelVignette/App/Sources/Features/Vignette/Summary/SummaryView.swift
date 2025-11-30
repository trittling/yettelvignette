//
//  SummaryView.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import SwiftUI

struct SummaryView: View {
    @Binding var path: NavigationPath
    
    @StateObject private var viewModel: SummaryViewModel
    
    init(path: Binding<NavigationPath>, order: VignetteOrder) {
        _path = path
        _viewModel = StateObject(wrappedValue: SummaryViewModel(order: order))
    }

    var body: some View {
        ZStack {
            Color.init(hex: Colors.backgroundColor.rawValue)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(Constans.Texts.summaryTitle.rawValue)
                        .bold()
                        .padding(.top, 24)
                        .padding(.leading, 16)
                        .padding(.bottom, 8)
                        .titleStlye()
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.horizontal, 16)
                
                HStack {
                    Text(Constans.Texts.plateNumber.rawValue)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    
                    Spacer()
                    
                    Text(viewModel.order.plateNumber)
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                    
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                }
                
                HStack {
                    Text(Constans.Texts.vignetteType.rawValue)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                    
                    Spacer()
                    
                    Text(viewModel.getVignetteTypeName())
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                }
                .padding(.bottom, 8)
                
                Divider()
                    .padding(.horizontal, 16)
                
                ScrollView {
                    VStack {
                        if !viewModel.order.selectedCounties.isEmpty {
                            ForEach(viewModel.order.selectedCounties, id: \.self) { county in
                                SummaryItemView(title: county.name, price: viewModel.price.formatToHuf())
                            }
                        } else {
                            SummaryItemView(title: viewModel.getVignetteTypeTitle(),
                                            price: viewModel.getVignetteTypePrice().formatToHuf())
                        }
                        
                        HStack() {
                            Text(Constans.Texts.usageFee.rawValue)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                            
                            Spacer()
                            
                            Text(viewModel.convenienceFee.formatToHuf())
                                .foregroundColor(Color(hex: Colors.primaryTextColor.rawValue))
                                .font(.system(size: 14, weight: .light))
                        }
                        .padding(.top, 16)
                    }
                }
                .padding(.horizontal, 16)
                
                Divider()
                    .padding(.horizontal, 4)
                
                AmountView(price: viewModel.sumPrice + viewModel.convenienceFee)
                
                Button(Constans.Texts.next.rawValue, action: {
                    path.append(NavigationDestination.success)
                })
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Button(Constans.Texts.cancel.rawValue, action: {
                    path.removeLast()
                })
                .buttonStyle(SecondaryButtonStyle())
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .navigationTitle(Constans.Texts.title.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.init(hex: Colors.green.rawValue), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    SummaryView(path: .constant(NavigationPath()), order: VignetteOrder())
}
