//
//  Nutrient.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-08.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation

struct Nutrient: Hashable, Codable {
    var label: String
    var quantity: String
    var unit: String
}
