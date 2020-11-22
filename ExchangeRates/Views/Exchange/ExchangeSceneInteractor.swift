//
//  ExchangeSceneInteractor.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

protocol ExchangeSceneBusinessLogic {
    func converseMoney(moneyToConverse: Double, conversingCase: String, valutePrice: Double)

}

protocol ExchangeSceneDataStore {
    var valutes: [Valute]? { get set }
}

class ExchangeSceneInteractor: ExchangeSceneBusinessLogic, ExchangeSceneDataStore {

    var valutes: [Valute]?
    
    var presenter: ExchangeScenePresentationLogic?
    var worker: ExchangeSceneWorker?
    
    
    func converseMoney(moneyToConverse: Double, conversingCase: String, valutePrice: Double) {
        let worker = ExchangeSceneWorker()
         
        let conversedMoney = worker.getConversedMoney(moneyToConverse: moneyToConverse, conversingCase: conversingCase, valutePrice: valutePrice)
        presenter?.presentValute(value: conversedMoney)
    }
    
    
    
    
    
    
}
