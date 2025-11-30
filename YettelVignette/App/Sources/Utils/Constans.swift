//
//  Constans.swift
//  YettelVignette
//
//  Created by Rittling Tamás on 2025. 11. 24..
//

enum Constans {
    enum Texts: String {
        case title = "E-matrica"
        case typeSelectorTitle = "Országos matricák"
        case buy = "Vásárlás"
        case annualTitle = "Éves vármegyei matricák"
        case amountToBePaid = "Fizetendő összeg"
        case summaryTitle = "Vásárlás megerősítése"
        case plateNumber = "Rendszám"
        case vignetteType = "Matrica típusa"
        case usageFee = "Rendszerhasználati díj"
        case next = "Tovább"
        case cancel = "Mégsem"
        case successTitle = "A matricákat \nsikeresen \nkifizetted!"
        case countyWarningTitle = "Figyelem!"
        case countyWarningMessage = "A kiválasztott megyék nem szomszédosak egymásssal!"
        case ok = "Ok"
    }
    
    enum Images: String {
        case car = "Car"
        case radioButtonOff = "RadioButton.off"
        case radioButtonOn = "RadioButton.on"
        case arrow = "Arrow"
        case checkboxOff = "Checkbox.off"
        case checkboxOn = "Checkbox.on"
        case yettelMan = "Yettelman"
        case map = "Map"
    }
    
    enum VignetteType: String {
        case week = "WEEK"
        case month = "MONTH"
        case day = "DAY"
        case year = "YEAR"
        
        var displayName: String {
            switch self {
            case .week: return "D1 - heti (10 napos)"
            case .month: return "D1 - havi"
            case .day: return "D1 - napi (1 napos)"
            case .year: return "D1 - éves"
            }
        }
        
        var detailName: String {
            switch self {
            case .week: return "Heti"
            case .month: return "Havi"
            case .day: return "Napi"
            case .year: return "Éves"
            }
        }
    }
}
