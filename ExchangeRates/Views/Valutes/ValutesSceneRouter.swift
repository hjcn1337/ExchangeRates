//
//  ValutesSceneRouter.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ValutesSceneRoutingLogic
{
    func routeToExchangeScene()
}

protocol ValutesSceneDataPassing
{
    var dataStore: ValutesSceneDataStore? { get }
}

class ValutesSceneRouter: NSObject, ValutesSceneRoutingLogic, ValutesSceneDataPassing
{
    weak var viewController: ValutesSceneViewController?
    var dataStore: ValutesSceneDataStore?
    
    // MARK: Routing
    
    func routeToExchangeScene()
    {
        let exchangeVC = UIStoryboard(name: "ExchangeScene", bundle: nil).instantiateViewController(withIdentifier: "ExchangeSceneViewController") as? ExchangeSceneViewController
        var exchangeDS = exchangeVC!.router!.dataStore!
        passDataToExchangeScene(source: dataStore!, destination: &exchangeDS)
        navigateToExchangeScene(source: viewController!, destination: exchangeVC!)
          
    }
    
    
    func navigateToExchangeScene(source: ValutesSceneViewController, destination: ExchangeSceneViewController)
    {
        source.present(destination, animated: true, completion: nil)
    }
    
    
    func passDataToExchangeScene(source: ValutesSceneDataStore, destination: inout ExchangeSceneDataStore)
    {
        destination.valutes = source.valutes
    }
}
