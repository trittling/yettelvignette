//
//  YettelVignetteApp.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

import SwiftUI

@main
struct YettelVignetteApp: App {
    
    init () {
        AppContainer.shared.setMockContainer()
    }
    
    var body: some Scene {
        WindowGroup {
            VignetteTypeSelectorView()
        }
    }
}
