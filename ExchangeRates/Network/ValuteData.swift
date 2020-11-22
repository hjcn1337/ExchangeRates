//
//  ValuteInfo.swift
//  myapp
//
//  Created by Ростислав Ермаченков on 03/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import Foundation

struct RootValuteData : Decodable {
    let Date: String
    let PreviousDate: String
    let PreviousURL: String
    let Timestamp: String
    let Valute: ValuteTypes
}

struct ValuteTypes : Decodable {
    
    let AUD: BaseValuteData
    let AZN: BaseValuteData
    let GBP: BaseValuteData
    let AMD: BaseValuteData
    let BYN: BaseValuteData
    let BGN: BaseValuteData
    let BRL: BaseValuteData
    let HUF: BaseValuteData
    let HKD: BaseValuteData
    let DKK: BaseValuteData
    let USD: BaseValuteData
    let EUR: BaseValuteData
    let INR: BaseValuteData
    let KZT: BaseValuteData
    let CAD: BaseValuteData
    let KGS: BaseValuteData
    let CNY: BaseValuteData
    let MDL: BaseValuteData
    let NOK: BaseValuteData
    let PLN: BaseValuteData
    let RON: BaseValuteData
    let XDR: BaseValuteData
    let SGD: BaseValuteData
    let TJS: BaseValuteData
    let TRY: BaseValuteData
    let TMT: BaseValuteData
    let UZS: BaseValuteData
    let UAH: BaseValuteData
    let CZK: BaseValuteData
    let SEK: BaseValuteData
    let CHF: BaseValuteData
    let ZAR: BaseValuteData
    let KRW: BaseValuteData
    let JPY: BaseValuteData
    
}

struct BaseValuteData : Decodable {
    
    let ID: String
    let NumCode: String
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
}
