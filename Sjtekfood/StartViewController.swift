//
//  StartViewController.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import UIKit
import Alamofire

class StartViewController: UIViewController {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var labelMeal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshMeal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onRefreshClick(_ sender: Any) {
        refreshMeal()
    }
    
    func refreshMeal() {
        Alamofire.request("https://sjtekfood.habets.io/api/dinners/next").responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                let dic = json as! NSDictionary
                self.labelHeader.text = "o shit here come"
                if let meal = Meal.fromJson(json: dic) {
                    self.labelMeal.text = "dat " + meal.name
                } else {
                    self.labelMeal.text = "dat error"
                }
            }
        }
    }
}
