//
//  AnnualSelectorViewModel.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 26..
//

import Foundation
import Combine

@MainActor
final class AnnualSelectorViewModel: ObservableObject {
    @Published var counties = [County]()
    @Published var sumPrice = 0
    
    var price: Int
    var selectedCounties = [County]()
    
    let countiesWithNeighbors: [String: [String]] = [
        "Bács-Kiskun": ["Baranya", "Tolna", "Pest", "Jász-Nagykun-Szolnok", "Békés"],
        "Baranya": ["Somogy", "Tolna", "Bács-Kiskun"],
        "Békés": ["Bács-Kiskun", "Jász-Nagykun-Szolnok", "Csongrád-Csanád"],
        "Borsod-Abaúj-Zemplén": ["Heves", "Nógrád", "Szabolcs-Szatmár-Bereg"],
        "Csongrád-Csanád": ["Békés", "Jász-Nagykun-Szolnok", "Bács-Kiskun"],
        "Fejér": ["Komárom-Esztergom", "Pest", "Tolna", "Veszprém"],
        "Győr-Moson-Sopron": ["Vas", "Komárom-Esztergom"],
        "Hajdú-Bihar": ["Szabolcs-Szatmár-Bereg", "Jász-Nagykun-Szolnok", "Heves"],
        "Heves": ["Nógrád", "Borsod-Abaúj-Zemplén", "Jász-Nagykun-Szolnok", "Hajdú-Bihar"],
        "Jász-Nagykun-Szolnok": ["Heves", "Hajdú-Bihar", "Szabolcs-Szatmár-Bereg", "Csongrád-Csanád", "Békés", "Pest"],
        "Komárom-Esztergom": ["Győr-Moson-Sopron", "Vas", "Fejér", "Pest", "Nógrád"],
        "Nógrád": ["Komárom-Esztergom", "Heves", "Borsod-Abaúj-Zemplén", "Pest"],
        "Pest": ["Komárom-Esztergom", "Fejér", "Tolna", "Jász-Nagykun-Szolnok", "Bács-Kiskun", "Nógrád"],
        "Somogy": ["Baranya", "Tolna", "Zala", "Veszprém"],
        "Szabolcs-Szatmár-Bereg": ["Hajdú-Bihar", "Jász-Nagykun-Szolnok", "Borsod-Abaúj-Zemplén"],
        "Tolna": ["Fejér", "Pest", "Baranya", "Somogy"],
        "Vas": ["Győr-Moson-Sopron", "Zala", "Veszprém", "Komárom-Esztergom"],
        "Veszprém": ["Fejér", "Somogy", "Zala", "Vas"],
        "Zala": ["Vas", "Veszprém", "Somogy"]
    ]
    
    init(counties: [County], price: Int) {
        self.counties = counties
        self.price = price
    }
    
    func selectVignette(county: County) {
        if let index = selectedCounties.firstIndex(of: county) {
            selectedCounties.remove(at: index)
        } else {
            selectedCounties.append(county)
        }
        
        sumPrice = selectedCounties.count * price
    }
    
    func checkSelectedCounties() -> Bool {
        if selectedCounties.count == 1 {
            return true
        }
        
        var neighbors = [String]()
        for selectedCounty in selectedCounties {
            neighbors.append(contentsOf: countiesWithNeighbors[selectedCounty.name] ?? [])
        }
        
        return selectedCounties.allSatisfy { county in
            neighbors.contains(county.name)
        }
    }
}
