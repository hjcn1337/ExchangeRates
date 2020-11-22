//
//  ExchangeViewController.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 13/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import UIKit

protocol ExchangeSceneDisplayLogic: class {
    func displayValute(valute: Double)
}

class ExchangeSceneViewController: UIViewController, ExchangeSceneDisplayLogic {
    
    var interactor: ExchangeSceneBusinessLogic?
    var router: (ExchangeSceneRoutingLogic & ExchangeSceneDataPassing)?
    
    let conversions = ["USD -> RUB", "RUB -> USD"]
    var valutes: [Valute]?
    
    var usdPrice : Double!
    var resultValue : Double!
    var convertingValue : Double!
    
   
    @IBOutlet weak var conversionPicker: UIPickerView!
    
    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueField: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup() {
        let viewController = self
        let interactor = ExchangeSceneInteractor()
        let presenter = ExchangeScenePresenter()
        let router = ExchangeSceneRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayValute(valute: Double) {
        
        self.valueLabel.text = String(valute)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let abroadKeyboardTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(abroadKeyboardTap)
        
        conversionPicker.delegate = self
        

        usdPrice = router?.dataStore?.valutes!.first(where: { $0.name == "Доллар США"})?.value
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func conversionButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        guard (valueField.text != "") else {
            showAlert()
            return
        }
        conversionPicker.isHidden = false

    }
    
    @objc func dismissKeyboard() {

        view.endEditing(true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Введите корректное значение", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        router?.routeToValutesScene()
    }
    
}

extension ExchangeSceneViewController : UIPickerViewDataSource, UIPickerViewDelegate {
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
            interactor?.converseMoney(moneyToConverse: convertingValue, conversingCase: conversions[row], valutePrice: usdPrice!)
            
            conversionButton.setTitle(conversions[row], for: .normal)
            self.valueLabel.isHidden = false
        } else {
            showAlert()
        }
        
        conversionPicker.isHidden = true
    }
}
