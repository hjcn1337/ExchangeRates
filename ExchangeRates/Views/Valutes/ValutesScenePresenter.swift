//
//  ValutesScenePresenter.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

protocol ValutesScenePresentationLogic {
    func presentValutes(response: [Valute])
}

class ValutesScenePresenter: ValutesScenePresentationLogic {
    weak var viewController: ValutesSceneDisplayLogic?
    
    func presentValutes(response: [Valute]) {
        
        var viewModel = [Valute]()
        
        for valute in response {
            viewModel.append(Valute(name: valute.name, value: valute.value.roundTo(places: 2)))
        }
        
        viewController?.displayValutes(viewModel: viewModel)
        
    }
}
