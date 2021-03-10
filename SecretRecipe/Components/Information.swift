//
//  Information.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Information: View {
    
    var gr: GeometryProxy
    
    var subTextColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var mainTextColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var intro = "This is my go-to chili recipe for everything from Frito pies to chili fries.  It can be left very basic or made more interesting with additions like chopped onions, kidney and pinto beans, and cans of diced tomatoes and chilies. "
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .foregroundColor(mainTextColor)
                        .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                        .padding(.bottom)
                    
                    Text("Source: \(recipe.source)")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                }
                
                
                Divider().padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("What is it?")
                        .foregroundColor(mainTextColor)
                        .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                        .padding(.bottom)

                    Text("Cuisine Type: \(recipe.cuisineType.joined(separator: ", "))")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    Text("Meal Type: \(recipe.mealType.joined(separator: ", "))")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    Text("Dish Type: \(recipe.dishType.joined(separator: ", "))")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                }
                
                
                Divider().padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("Basic Info before Getting Started")
                        .foregroundColor(mainTextColor)
                        .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                        .padding(.bottom)
                    
                    Text("Calories: \(recipe.calories) kCal")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    Text("Total weight: \(recipe.totalWeight) g")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    Text("Servings: \(recipe.servings) people")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    
                    Text("Diet Label: \(recipe.dietLabels.joined(separator: ", "))")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                    Text("Health Label: \(recipe.healthLabel.joined(separator: ", "))")
                        .foregroundColor(self.subTextColor)
                        .padding([.bottom, .leading])
                    
                }
                
                Divider().padding([.top, .bottom])
                
            }.padding()
        }.padding(.bottom, gr.size.height*0.4)
        .frame(width: gr.size.width)
        .background(Color(red: 243/255, green: 245/255, blue: 249/255))
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Information(gr: gr, recipe: Recipe(title: "For California Rolls", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: [], ingredients: [], isFavorite: false, servings: 0, source: "", cuisineType: [], mealType: [], dishType: []))
        }
    }
}
