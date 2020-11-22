//
//  ExchangeScenePresenter.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

protocol ExchangeScenePresentationLogic {
    func presentValute(value: Double)
}

class ExchangeScenePresenter: ExchangeScenePresentationLogic {
    
    weak var viewController: ExchangeSceneDisplayLogic?
    
    func presentValute(value: Double) {
        let viewModel = value
        viewController?.displayValute(valute: viewModel)
    }
}
