//
//  Recipe.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation

struct Recipe: Hashable, Codable {
   
    var title: String
    var img: String
    var calories: Int
    var totalWeight: Int
    var dietLabels: [String]
    var healthLabel: [String]
    var ingredients: [String]
    var isFavorite: Bool
    var servings: Int
    
}
