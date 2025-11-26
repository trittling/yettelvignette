//
//  VignetteInteractor.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation

protocol VignetteInteractorType {
    func getVehicleInfo()
    async -> Result<VehicleInfo, VehicleInfoError>
    
    func getHighwayInfo()
    async -> Result<HighwayInfo, HighwayInfoError>
}

final actor VignetteInteractor: VignetteInteractorType {
    @Injected var client: APIProtocol
    
    func getVehicleInfo() async -> Result<VehicleInfo, VehicleInfoError> {
        do {
            let response = try await self.client.getVehicleInfo()
            
            if case let .ok(okResponse) = response {
                return await .success(self.mapVehicleInfo(from: try okResponse.body.json))
            } else {
                return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
    
    func getHighwayInfo() async -> Result<HighwayInfo, HighwayInfoError> {
        do {
            let response = try await self.client.getHighwayInfo()
            
            if case let .ok(okResponse) = response {
                return await .success(self.mapHighwayInfo(from: try okResponse.body.json))
            } else {
                return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
}

private extension VignetteInteractor {
    func mapVehicleInfo(from apiModel: Operations.getVehicleInfo.Output.Ok.Body.jsonPayload) -> VehicleInfo {
        return VehicleInfo(statusCode: apiModel.statusCode ?? "",
                           internationalRegistrationCode: apiModel.internationalRegistrationCode ?? "",
                           type: apiModel._type ?? "",
                           name: apiModel.name ?? "",
                           plate: apiModel.plate ?? "",
                           country: VehicleInfo.Country(hu: apiModel.country?.hu ?? "", en: apiModel.country?.en ?? ""),
                           vignetteType: apiModel.vignetteType ?? ""
        )
    }
    
    func mapHighwayInfo(from apiModel: Operations.getHighwayInfo.Output.Ok.Body.jsonPayload) -> HighwayInfo {
        var highwayVignettes = [HighwayVignette]()
        for vignette in apiModel.payload?.highwayVignettes ?? [] {
            let highwayVignette = HighwayVignette(vignetteType: vignette.vignetteType ?? [],
                                                  vehicleCategory: vignette.vehicleCategory ?? "",
                                                  cost: Int(vignette.cost ?? 0.0),
                                                  trxFee: Int(vignette.trxFee ?? 0.0),
                                                  sum: Int(vignette.sum ?? 0.0))
            highwayVignettes.append(highwayVignette)
        }
        
        
        
        return HighwayInfo(highwayVignettes: highwayVignettes,
                           vehicleCategories: apiModel.payload?.vehicleCategories as? [VehicleCategory] ?? [],
                           counties: apiModel.payload?.counties as? [County] ?? [],
                           requestId: apiModel.requestId ?? "",
                           statusCode: apiModel.statusCode ?? "",
                           dataType: apiModel.payload.debugDescription)
    }
}
