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
    @Published var selectedVignette: HighwayVignette?
    @Published var name: String = ""
    @Published var plateNumber: String = ""
    @Published var highwayVignettes: [HighwayVignette] = []
    @Published var vignetteOrder = VignetteOrder()
    
    var counties = [County]()
    var annualFee: Int = 0
    
   @Injected private var vignetteInteractor: VignetteInteractorType
    
    func getData() async {
        let citiesResult = await vignetteInteractor.getVehicleInfo()
        if let successResult = citiesResult.successResult {
            name = successResult.name
            plateNumber = successResult.plate
            vignetteOrder.name = successResult.name
            vignetteOrder.plateNumber = successResult.plate.uppercased()
        }
        
        
        let highwayResult = await vignetteInteractor.getHighwayInfo()
        if let successResult = highwayResult.successResult {
            highwayVignettes = successResult.highwayVignettes
            counties = successResult.counties
            vignetteOrder.highwayVignettes = successResult.highwayVignettes
            vignetteOrder.counties = successResult.counties
            
            for type in successResult.highwayVignettes {
                if type.vignetteType.count > 1 && ((type.vignetteType.first?.starts(with: "YEAR_")) != nil) {
                    annualFee = type.sum
                    vignetteOrder.selectedVignettes.append(type)
                    vignetteOrder.price = type.sum
                }
            }
            
        }
    }
}
