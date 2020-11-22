//
//  DoubleExtensions.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 22.11.2020.
//  Copyright © 2020 Ростислав Ермаченков. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
