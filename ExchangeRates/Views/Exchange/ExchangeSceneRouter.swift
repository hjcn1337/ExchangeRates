//
//  ExchangeSceneRouter.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ExchangeSceneRoutingLogic
{
    func routeToValutesScene()
}

protocol ExchangeSceneDataPassing
{
    var dataStore: ExchangeSceneDataStore? { get }
}

class ExchangeSceneRouter: NSObject, ExchangeSceneRoutingLogic, ExchangeSceneDataPassing
{
    weak var viewController: ExchangeSceneViewController?
    var dataStore: ExchangeSceneDataStore?
    
    // MARK: Routing
    
    func routeToValutesScene()
    {
        let valutesVC = UIStoryboard(name: "ValutesScene", bundle: nil).instantiateViewController(withIdentifier: "ValutesSceneViewController") as? ValutesSceneViewController
        var valutesDS = valutesVC!.router!.dataStore!
        passDataToValutesScene(source: dataStore!, destination: &valutesDS)
        navigateToValutesScene(source: viewController!, destination: valutesVC!)
        
        
    }
    
    // MARK: Navigation
    
    func navigateToValutesScene(source: ExchangeSceneViewController, destination: ValutesSceneViewController)
    {
        source.present(destination, animated: true, completion: nil)
    }
    
    
    func passDataToValutesScene(source: ExchangeSceneDataStore, destination: inout ValutesSceneDataStore)
    {
        //destination.name = source.name
    }
}
