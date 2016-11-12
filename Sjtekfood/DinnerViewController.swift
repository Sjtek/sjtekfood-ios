//
//  DinnerViewController.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import UIKit

class DinnerViewController: UITableViewController {
    
    var dinnerList = [Dinner]()
    let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "EEE, dd MM"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dinnerList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dinnerCellId", for: indexPath)

        let dinner = dinnerList[indexPath.row]
        cell.textLabel?.text = dinner.meal.name
        cell.detailTextLabel?.text = dateFormatter.string(from: dinner.date)

        return cell
    }
}
