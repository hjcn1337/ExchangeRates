//
//  ValuteTableViewController.swift
//  ExchangeRates
//
//  Created by Ростислав Ермаченков on 06/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import UIKit

protocol ValutesSceneDisplayLogic: class {
    func displayValutes(viewModel: [Valute])
}

class ValutesSceneViewController: UIViewController, UITableViewDataSource, ValutesSceneDisplayLogic {
    
    var interactor: ValutesSceneBusinessLogic?
    var router: (ValutesSceneRoutingLogic & ValutesSceneDataPassing)?
    
    private let refreshControl = UIRefreshControl()
    var valutes = [Valute]()
    
    @IBOutlet var tableView: UITableView!
    
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
        let interactor = ValutesSceneInteractor()
        let presenter = ValutesScenePresenter()
        let router = ValutesSceneRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        getValutes()
        
    }
    
    @objc func getValutes() {
        interactor?.getValutes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    func displayValutes(viewModel: [Valute]) {
        valutes = viewModel
       
    }

    func setupTableView() {
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Данные обновляются ...")
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        tableView.refreshControl!.addTarget(self, action: #selector(getValutes), for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.valutes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValuteCell", for: indexPath) as! ValuteCell
        
        cell.nameLabel.text = self.valutes[indexPath.row].name
        cell.valueLabel.text = String(self.valutes[indexPath.row].value)

        return cell
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        router?.routeToExchangeScene()
    }
    

}
