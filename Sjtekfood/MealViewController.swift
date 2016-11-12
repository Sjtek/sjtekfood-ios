//
//  MealViewController.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import UIKit
import Alamofire

class MealViewController: UITableViewController {
    
    var mealList = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return mealList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCellId", for: indexPath)

        cell.textLabel?.text = mealList[indexPath.row].name

        return cell
    }
    
    func refreshData() {
        Alamofire.request("https://sjtekfood.habets.io/api/meals").responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                let arr = json as! [NSDictionary]
                var meals = [Meal]()
                for mealDic: NSDictionary in arr {
                    if let parsedMeal = Meal.fromJson(json: mealDic) {
                        meals.append(parsedMeal)
                    }
                    
                }
                self.mealList = meals
                self.tableView.reloadData()
            }
        }
    }
}
