//
//  ExchangeSceneWorker.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

class ExchangeSceneWorker {
     
    func getConversedMoney(moneyToConverse: Double, conversingCase: String, valutePrice: Double) -> Double {
        var result: Double!
        switch conversingCase {
        case "USD -> RUB":
            result = moneyToConverse * valutePrice
        case "RUB -> USD":
            result = moneyToConverse / valutePrice
        default:
            result = 0
        }
        
        return result.roundTo(places: 2)
    }
    
}
