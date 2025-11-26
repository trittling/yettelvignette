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
    @Published var name: String = ""
    @Published var plateNumber: String = ""
    
   @Injected private var vignetteInteractor: VignetteInteractorType
    
    func getVehicleInfo() async {
        let citiesResult = await vignetteInteractor.getVehicleInfo()
        if let successResult = citiesResult.successResult {
            name = successResult.name
            plateNumber = successResult.plate
        }
        
        
        let highwayResult = await vignetteInteractor.getHighwayInfo()
        if let successResult = highwayResult.successResult {
            print(successResult.requestId)
        }
    }
}
