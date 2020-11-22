//
//  ExchangeViewController.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 13/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    let conversions = ["USD -> RUB", "RUB -> USD"]
    
    var usdPrice : Double!
    var resultValue : Double!
    var convertingValue : Double!
    
   
    @IBOutlet weak var conversionPicker: UIPickerView!
    
    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueField: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ValuteScene", bundle: nil).instantiateViewController(withIdentifier: "ValuteViewController") as? ValuteViewController
        
        self.present(vc!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let abroadKeyboardTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(abroadKeyboardTap)
        
        conversionPicker.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func conversionButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        guard (valueField.text != "") else { return }
        conversionPicker.isHidden = false

    }
    
    @objc func dismissKeyboard() {

        view.endEditing(true)
    }
    
}

extension ExchangeViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return conversions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return conversions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let convertingValue = Double(valueField.text!) {
            switch conversions[row] {
            case "USD -> RUB":
                resultValue = convertingValue * usdPrice
                
            case "RUB -> USD":
                resultValue = convertingValue / usdPrice
            default:
                resultValue = 0
            }
            
            self.valueLabel.text = String(resultValue.roundTo(places: 2))

            
            conversionButton.setTitle(conversions[row], for: .normal)
        } else {
            self.valueLabel.text = "Введите корректное значение"
        }
        
        self.valueLabel.isHidden = false
        conversionPicker.isHidden = true
    }
}
