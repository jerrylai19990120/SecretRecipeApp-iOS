//
//  Ingredients.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Ingredients: View {
    
    var gr: GeometryProxy
    
    var ingredients = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("1/2 cup of milk")
            Text("1/3 cup of olive oil")
            Text("1 cup of rice")
            Text("3 cup of water")
            Text("3 spoons of salt")
        }
    }
}

struct Ingredients_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Ingredients(gr: gr)
        }
    }
}
