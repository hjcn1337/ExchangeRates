//
//  Valute.swift
//  myapp
//
//  Created by Ростислав Ермаченков on 06/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import Foundation

class Valute {
    
    let name: String
    let value: Double
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value.roundTo(places: 2)
    }
}

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

