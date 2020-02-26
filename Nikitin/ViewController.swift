//
//  ViewController.swift
//  Nikitin
//
//  Created by Ivan Nikitin on 26.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataFetchService = DataFetcherService()
    
    var scheduel : [Schedule]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        self.view = tableView
        tableView.dataSource = self
        
        dataFetchService.fetchSchedule { (scheduel) in
            print(scheduel)
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

