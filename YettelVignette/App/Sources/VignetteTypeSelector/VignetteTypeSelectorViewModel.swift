//
//  VignetteTypeSelectorViewModel.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 25..
//

import Foundation
import Combine

@MainActor
final class VignetteTypeSelectorViewModel: ObservableObject {
    @Published var selectedTitle: String = ""
}
