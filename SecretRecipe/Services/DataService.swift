//
//  DataService.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let instance = DataService()
    
    var recipes = [Recipe]()
    
    var trendingRecipes = [Recipe]()
    
    var hotRecipes = [Recipe]()
    
    var categoryRecipes = [Recipe]()
    
    var mealType = [String]()
    
    var cuisineType = [String]()
    
    var dishType = [String]()
    
    func getRecipesByCategory(_ category: String, completion: @escaping (_ status: Bool)->()){
        
        categoryRecipes = []
        
        let urlString = "https://api.edamam.com/search?q=f&app_id=\(APP_ID)&app_key=\(API_KEY)&cuisineType=\(category)&to=100"
        
        let url = urlString.replacingOccurrences(of: " ", with: "%20")
        
        AF.request(url).responseJSON { (res) in
            print(res)
            if res.error == nil {
                do {
                    let data = res.data
                    let json = try? JSON(data: data!)
                    
                    guard let recipes = json!["hits"].array else {
                        completion(false)
                        return
                    }
                    
                    for recipe in recipes {
                        var health = [String]()
                        var diet = [String]()
                        var ingredients = [String]()
                        
                        let calories = Int(Double(recipe["recipe"]["calories"].stringValue)!)
                        let totalWeight = Int(Double(recipe["recipe"]["totalWeight"].stringValue)!)
                        let title = recipe["recipe"]["label"].stringValue
                        let img = recipe["recipe"]["image"].stringValue
                        let servings = recipe["recipe"]["yield"].intValue
                        let healthLbls = recipe["recipe"]["healthLabels"].array
                        let dietLbls = recipe["recipe"]["dietLabels"].array
                        let ingred = recipe["recipe"]["ingredientLines"].array
                        
                        for i in healthLbls! {
                            health.append(i.stringValue)
                        }
                        
                        for i in dietLbls! {
                            diet.append(i.stringValue)
                        }
                        
                        for i in ingred! {
                            ingredients.append(i.stringValue)
                        }
                        
                        let result = Recipe(title: title, img: img, calories: calories, totalWeight: totalWeight, dietLabels: diet, healthLabel: health, ingredients: ingredients, isFavorite: false, servings: servings)
                        
                        self.categoryRecipes.append(result)
                        
                    }
                    completion(true)
                    
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(false)
            }
        }
        
    }
    
    
}
