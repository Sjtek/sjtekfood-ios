//
//  Meal.swift
//  Sjtekfood
//
//  Created by Wouter Habets on 12/11/2016.
//  Copyright © 2016 Sjtek. All rights reserved.
//

import Foundation

class Meal {
    
    var id: Int
    var name: String
    
    init() {
        id = 0
        name = ""
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name;
    }
    
    static func fromJson(json: NSDictionary) -> Meal? {
        if let id = json["id"] as? Int {
            if let name = json["name"] as? String {
                return Meal(id: id, name: name)
            }
        }
        return nil
    }
}
