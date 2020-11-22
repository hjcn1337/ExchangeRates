//
//  ValuteTableViewController.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 06/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import UIKit

class ValuteViewController: UIViewController, UITableViewDataSource {
    private let refreshControl = UIRefreshControl()
    let valuteApi = ValuteApi()
    var valutes = [Valute]()
    
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        tableView.dataSource = self
        
        getExchangeRates()
        
    }
    
    @objc private func getExchangeRates() {
        
        self.valuteApi.getExchangeRates() {
            DispatchQueue.main.async {
                self.valutes = self.valuteApi.valutes
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
        }
        
    }

    func setupTableView() {
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Данные обновляются ...")
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        tableView.refreshControl!.addTarget(self, action: #selector(getExchangeRates), for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valuteApi.valutes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValuteCell", for: indexPath) as! ValuteCell
        
        cell.nameLabel.text = valutes[indexPath.row].name
        cell.valueLabel.text = String(valutes[indexPath.row].value)

        return cell
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) { 
        let vc = UIStoryboard(name: "ExchangeScene", bundle: nil).instantiateViewController(withIdentifier: "ExchangeViewController") as? ExchangeViewController
        vc?.usdPrice = valutes.first(where: { $0.name == "Доллар США"})?.value
        self.present(vc!, animated: true, completion: nil)
    }
    

}
