//
//  DinnerViewController.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import UIKit
import Alamofire

class DinnerViewController: UITableViewController {
    
    var dinnerList = [Dinner]()
    let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "EEE, dd - MM"
        refreshData()
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
    
    func refreshData() {
        Alamofire.request("https://sjtekfood.habets.io/api/dinners").responseJSON { response in
            
            if let json = response.result.value {
                let arr = json as! [NSDictionary]
                var dinners = [Dinner]()
                for dinnerDic: NSDictionary in arr {
                    if let parsedDinner = Dinner.fromJson(json: dinnerDic) {
                        dinners.append(parsedDinner)
                    }
                    
                }
                self.dinnerList = dinners
                self.tableView.reloadData()
            }
        }
    }
}
