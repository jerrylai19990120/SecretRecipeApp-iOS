//
//  DetailComponent.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DetailComponent: View {
    
    var gr: GeometryProxy
    
    var recipe: Recipe = Recipe(title: "No info", img: "", calories: 0, totalWeight: 0, dietLabels: [""], healthLabel: [""], ingredients: [""], isFavorite: false, servings: 0, source: "No info", cuisineType: [], mealType: [], dishType: [])
    
    var nutrients: [Nutrient] = [Nutrient(label: "", quantity: "", unit: "")]
    
    @State var selection = -1
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(recipe.title)
                .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                .padding(.leading, gr.size.width*0.08)
                
            Text(recipe.healthLabel.count != 0 ? recipe.healthLabel[0] : "Try out this new recipe")
                .font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .padding(.top, 8)
                .padding(.leading, gr.size.width*0.08)
            
            
            HStack(spacing: gr.size.width*0.1) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(recipe.calories) kCal")
                }
                
                HStack {
                    Image(systemName: "square.stack.3d.up")
                        .foregroundColor(.blue)
                    Text("\(recipe.totalWeight) g")
                }
                HStack {
                    Image(systemName: "number.circle.fill")
                        .foregroundColor(.orange)
                    Text("\(recipe.servings) servings")
                }
            }.padding([.bottom, .trailing])
            .padding(.leading, gr.size.width*0.08)
            
            VStack(spacing: 0) {
                CustomTopTabBar(gr: gr, selection: $selection, recipe: recipe)
                
                if selection == -1 {
                    Information(gr: gr, recipe: recipe)
                    
                }
                
                if selection == 0 {
                    Ingredients(gr: gr, recipe: recipe)
                }
                
                if selection == 1 {
                    Nutrients(gr: gr, recipe: recipe, nutrients: self.nutrients)
                }

            }
            
            
        }.frame(width: gr.size.width, height: gr.size.height)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailComponent_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DetailComponent(gr: gr)
        }
    }
}
