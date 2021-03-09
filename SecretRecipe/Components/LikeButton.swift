//
//  LikeButton.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct LikeButton: View {
    
    var gr: GeometryProxy
    
    @State var isFavorite: Bool
    
    var recipe: Recipe
    
    var nutrient: [Nutrient]
    
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
            .onTapGesture {
                
                var favors = DataService.instance.loadFavoriteRecipes()
                var nutrition = DataService.instance.loadNutrients()
                let hadDuplicate = favors.contains {
                    element in
                    if self.recipe.title == element.title {
                        return true
                    } else {
                        return false
                    }
                }
                
                if self.isFavorite {
                    self.isFavorite.toggle()
                    let index = favors.firstIndex { element in
                        element.title == self.recipe.title
                    }
                    favors.remove(at: index!)
                    nutrition.remove(at: index!)
                    
                    DataService.instance.saveFavoriteRecipes(favors)
                    DataService.instance.saveNutrients(nutrition)
                } else if hadDuplicate {
                    //do nothing
                } else {
                    self.isFavorite.toggle()
                    nutrition.append(self.nutrient)
                    favors.append(self.recipe)
                    DataService.instance.saveFavoriteRecipes(favors)
                    DataService.instance.saveNutrients(nutrition)
                }
                
                
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            LikeButton(gr: gr, isFavorite: true, recipe: Recipe(title: "", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: [], ingredients: [], isFavorite: true, servings: 0, source: "", cuisineType: [], mealType: [], dishType: []), nutrient: [])
        }
    }
}
