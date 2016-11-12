//
//  Dinner.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import Foundation

class Dinner {
    var id: Int
    var date: Date
    var meal: Meal
    
    init() {
        id = 0
        date = Date()
        meal = Meal()
    }
    
    init(id: Int, date: Date, meal: Meal) {
        self.id = id
        self.date = date
        self.meal = meal
    }
}
