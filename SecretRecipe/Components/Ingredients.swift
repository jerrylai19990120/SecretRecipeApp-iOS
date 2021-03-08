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
    
    var subTextColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var mainTextColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: gr.size.height*0.012) {
                Text("For \(recipe.title)")
                    .foregroundColor(mainTextColor)
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .padding(.bottom)
                ForEach(recipe.ingredients, id: \.self){ item in
                    Text("•\(item)")
                        .foregroundColor(self.subTextColor)
                }
                
                Divider().padding([.top, .bottom])
                
            }.padding()
            
        }.padding(.bottom, gr.size.height*0.4)
        .frame(width: gr.size.width)
        .background(Color(red: 243/255, green: 245/255, blue: 249/255))
        
    }
}

struct Ingredients_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Ingredients(gr: gr, recipe: Recipe(title: "", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: [], ingredients: [], isFavorite: false, servings: 0, source: "", cuisineType: [], mealType: [], dishType: []))
        }
    }
}
