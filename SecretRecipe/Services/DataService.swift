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
import SwiftUI

class DataService {
    
    static let instance = DataService()
    
    var recipes = [Recipe]()
    
    var trendingRecipes = [Recipe]()
    
    var hotRecipes = [Recipe]()
    
    var categoryRecipes = [Recipe]()
    
    var searchRecipes = [Recipe]()
    
    var mealType = ["Breakfast", "Lunch", "Dinner", "Snack", "Teatime"]
    
    var dishType = ["Alcohol-cocktail",
    "Biscuits",
    "Bread",
    "Cereals",
    "Condiments",
    "Drinks",
    "Desserts",
    "Egg",
    "Main Course",
    "Omelet",
    "Pancake",
    "Preps",
    "Preserve",
    "Salad",
    "Sandwiches",
    "Soup",
    "Starter"]
    
    var categories: [CategoryRowData] = [
        CategoryRowData(cate1: "Breakfast", cate2: "Lunch", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "breakfast", img2: "lunch", index1: 0, index2: 1),
        CategoryRowData(cate1: "Dinner", cate2: "Snack", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "dinner", img2: "snack", index1: 2, index2: 3),
        CategoryRowData(cate1: "Teatime", cate2: "Alcohol-cocktail", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "tea", img2: "cocktails", index1: 4, index2: 5),
        CategoryRowData(cate1: "Biscuits", cate2: "Bread", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "biscuits", img2: "bread", index1: 6, index2: 7),
        CategoryRowData(cate1: "Cereals", cate2: "Condiments", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "cereals", img2: "condiments", index1: 8, index2: 9),
        CategoryRowData(cate1: "Drinks", cate2: "Desserts", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "drinks", img2: "desert", index1: 10, index2: 11),
        CategoryRowData(cate1: "Egg", cate2: "Main Course", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "egg", img2: "main", index1: 12, index2: 13),
        CategoryRowData(cate1: "Omelet", cate2: "Pancake", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "omelet", img2: "pancakeBg", index1: 14, index2: 15),
        CategoryRowData(cate1: "Preps", cate2: "Preserve", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "preps", img2: "preserve", index1: 16, index2: 17),
        CategoryRowData(cate1: "Salad", cate2: "Sandwiches", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "salad", img2: "sandwich", index1: 18, index2: 19),
        CategoryRowData(cate1: "Soup", cate2: "Starter", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "soup", img2: "starters", index1: 20, index2: 21),
        CategoryRowData(cate1: "American", cate2: "Asian", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "american", img2: "asian", index1: 22, index2: 23),
        CategoryRowData(cate1: "British", cate2: "Caribbean", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "british", img2: "caribbean", index1: 24, index2: 25),
        CategoryRowData(cate1: "Central Europe", cate2: "Chinese", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "centralEurope", img2: "chinese", index1: 26, index2: 27),
        CategoryRowData(cate1: "Eastern Europe", cate2: "French", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "easternEurope", img2: "french", index1: 28, index2: 29),
        CategoryRowData(cate1: "Indian", cate2: "Italian", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "indian", img2: "italian", index1: 30, index2: 31),
        CategoryRowData(cate1: "Japanese", cate2: "Kosher", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "japanese", img2: "kosher", index1: 32, index2: 33),
        CategoryRowData(cate1: "Mediterranean", cate2: "Mexican", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "mediterranean", img2: "mexican", index1: 34, index2: 35),
        CategoryRowData(cate1: "Middle Eastern", cate2: "Nordic", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "middleEastern", img2: "nordic", index1: 36, index2: 37),
        CategoryRowData(cate1: "South American", cate2: "South East Asian", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "southAmerican", img2: "southEastAsian", index1: 38, index2: 39),
    ]
    
    func getRecipesByCategory(_ category: String, completion: @escaping (_ status: Bool)->()){
        
        categoryRecipes = []
        
        var urlString = "https://api.edamam.com/search?q=f&app_id=\(APP_ID)&app_key=\(API_KEY)&cuisineType=\(category)&to=100"
        
        if mealType.contains(category) {
            
            urlString = "https://api.edamam.com/search?q=f&app_id=\(APP_ID)&app_key=\(API_KEY)&mealType=\(category)&to=100"
        } else if dishType.contains(category) {
            
            urlString = "https://api.edamam.com/search?q=f&app_id=\(APP_ID)&app_key=\(API_KEY)&dishType=\(category)&to=100"
        }
        
        
        
        let url = urlString.replacingOccurrences(of: " ", with: "%20")
        
        AF.request(url).responseJSON { (res) in
            
            if res.error == nil {
                do {
                    let data = res.data
                    let json = try? JSON(data: data!)
                    
                    
                    guard let recipes = json!["hits"].array else {
                        completion(false)
                        return
                    }
                    
                    guard let exists = json?["more"] else {
                        completion(false)
                        return
                    }
                    
                    if !exists.boolValue {
                        completion(true)
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
                    completion(false)
                    print(error.localizedDescription)
                }
            } else {
                completion(false)
            }
        }
        
    }
    
    
    func getHotAndTrending(_ query: String, completion: @escaping (_ status: Bool)->()){
        
        var urlString = "https://api.edamam.com/search?q=f&app_id=\(APP_ID)&app_key=\(API_KEY)"
        
        
    }
    
    func getSearchRecipe(_ query: String, completion: @escaping (_ status: Bool)->()){
        
        self.searchRecipes = []
        
        var urlString = "https://api.edamam.com/search?q=\(query)&app_id=\(APP_ID)&app_key=\(API_KEY)"
        
        AF.request(urlString).responseJSON { (res) in
            if res.error == nil {
                do {
                        let data = res.data
                        let json = try? JSON(data: data!)
                        
                        
                        guard let recipes = json!["hits"].array else {
                            completion(false)
                            return
                        }
                        
                        guard let exists = json?["more"] else {
                            completion(false)
                            return
                        }
                        
                        if !exists.boolValue {
                            completion(true)
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
                            
                            self.searchRecipes.append(result)
                        }
                        completion(true)

                    
                    
                } catch {
                    completion(false)
                    print(error.localizedDescription)
                }
            } else {
                completion(false)
            }
        }
        
    }
    
    
}
