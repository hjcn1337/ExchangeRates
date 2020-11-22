//
//  ValutesSceneInteractor.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

protocol ValutesSceneBusinessLogic {
    func getValutes(completion: @escaping () -> ())
}

protocol ValutesSceneDataStore {
    var valutes: [Valute]? { get set }
    
}

class ValutesSceneInteractor: ValutesSceneBusinessLogic, ValutesSceneDataStore {
    
    var presenter: ValutesScenePresentationLogic?
    var worker: ValutesSceneWorker?
    var valutes: [Valute]?
    
    
    func getValutes(completion: @escaping () -> ()) {
        
        worker = ValutesSceneWorker()
        self.worker?.getValutes() { valutes in
            DispatchQueue.main.async {
                self.valutes = valutes
                self.presenter?.presentValutes(response: self.valutes!)
                completion()
            }
        }
        
        
    }
}
