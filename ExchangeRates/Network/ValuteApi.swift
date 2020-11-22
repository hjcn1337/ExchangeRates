//
//  ValuteApi.swift
//  myapp
//
//  Created by Ростислав Ермаченков on 03/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import Foundation
import Alamofire

class ValuteApi : BaseApi {
    
    var valutes = [Valute]()
    
    func getExchangeRates(completion: @escaping () -> Void) {
        valutes = []
        
        let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js")
        let request = URLRequest(url: url!)
        
        call(with: request, completion: { response in
            if let exchangeRates = try? JSONDecoder().decode(RootValuteData.self, from: response.data!) {
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.AUD.Name), value: (exchangeRates.Valute.AUD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.AZN.Name), value: (exchangeRates.Valute.AZN.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.GBP.Name), value: (exchangeRates.Valute.GBP.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.AMD.Name), value: (exchangeRates.Valute.AMD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.BYN.Name), value: (exchangeRates.Valute.BYN.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.BGN.Name), value: (exchangeRates.Valute.BGN.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.BRL.Name), value: (exchangeRates.Valute.BRL.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.HUF.Name), value: (exchangeRates.Valute.HUF.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.HKD.Name), value: (exchangeRates.Valute.HKD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.DKK.Name), value: (exchangeRates.Valute.DKK.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.USD.Name), value: (exchangeRates.Valute.USD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.EUR.Name), value: (exchangeRates.Valute.EUR.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.INR.Name), value: (exchangeRates.Valute.INR.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.KZT.Name), value: (exchangeRates.Valute.KZT.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.CAD.Name), value: (exchangeRates.Valute.CAD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.KGS.Name), value: (exchangeRates.Valute.KGS.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.CNY.Name), value: (exchangeRates.Valute.CNY.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.MDL.Name), value: (exchangeRates.Valute.MDL.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.NOK.Name), value: (exchangeRates.Valute.NOK.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.PLN.Name), value: (exchangeRates.Valute.PLN.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.RON.Name), value: (exchangeRates.Valute.RON.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.XDR.Name), value: (exchangeRates.Valute.XDR.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.SGD.Name), value: (exchangeRates.Valute.SGD.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.TJS.Name), value: (exchangeRates.Valute.TJS.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.TRY.Name), value: (exchangeRates.Valute.TRY.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.TMT.Name), value: (exchangeRates.Valute.TMT.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.UZS.Name), value: (exchangeRates.Valute.UZS.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.UAH.Name), value: (exchangeRates.Valute.UAH.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.CZK.Name), value: (exchangeRates.Valute.CZK.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.SEK.Name), value: (exchangeRates.Valute.SEK.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.CHF.Name), value: (exchangeRates.Valute.CHF.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.ZAR.Name), value: (exchangeRates.Valute.ZAR.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.KRW.Name), value: (exchangeRates.Valute.KRW.Value)))
                
                self.valutes.append(Valute(name: (exchangeRates.Valute.JPY.Name), value: (exchangeRates.Valute.JPY.Value)))
                
            }
            completion()

        })
        
        
        
    }
    
}

