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
    
    var searchNutrients = [[Nutrient]]()
    
    var categoryNutrients = [[Nutrient]]()
    
    var hotNutrients = [[Nutrient]]()
    
    var trendingNutrients = [[Nutrient]]()
    
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
                        var cuisine = [String]()
                        var meal = [String]()
                        var dish = [String]()
                        
                        let calories = Int(Double(recipe["recipe"]["calories"].stringValue)!)
                        let totalWeight = Int(Double(recipe["recipe"]["totalWeight"].stringValue)!)
                        let title = recipe["recipe"]["label"].stringValue
                        let img = recipe["recipe"]["image"].stringValue
                        let servings = recipe["recipe"]["yield"].intValue
                        let healthLbls = recipe["recipe"]["healthLabels"].array
                        let dietLbls = recipe["recipe"]["dietLabels"].array
                        let ingred = recipe["recipe"]["ingredientLines"].array
                        
                        let cuisineType = recipe["recipe"]["cuisineType"].array
                        
                        let mealType = recipe["recipe"]["mealType"].array
                        
                        let dishType = recipe["recipe"]["dishType"].array
                        
                        let source = recipe["recipe"]["source"].stringValue
                        
                        if let cuisineTypes = cuisineType {
                            for i in cuisineTypes {
                                cuisine.append(i.stringValue)
                            }
                        }
                        
                        if let mealTypes = mealType {
                            for i in mealTypes {
                                meal.append(i.stringValue)
                            }
                        }
                        
                        if let dishTypes = dishType {
                            for i in dishTypes {
                                dish.append(i.stringValue)
                            }
                        }
                        
                        for i in healthLbls! {
                            health.append(i.stringValue)
                        }
                        
                        for i in dietLbls! {
                            diet.append(i.stringValue)
                        }
                        
                        for i in ingred! {
                            ingredients.append(i.stringValue)
                        }
                        
                        let result = Recipe(title: title, img: img, calories: calories, totalWeight: totalWeight, dietLabels: diet, healthLabel: health, ingredients: ingredients, isFavorite: false, servings: servings, source: source, cuisineType: cuisine, mealType: meal, dishType: dish)
                        
                        self.categoryNutrients.append(self.extractNutrient(recipe))
                        
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
    
    
    func getHotAndTrending(isTrending: Bool, completion: @escaping (_ status: Bool)->()){
        
        if isTrending {
            if self.trendingRecipes.count != 0 {
                completion(true)
                return
            }
        } else {
            if self.hotRecipes.count != 0 {
                completion(true)
                return
            }
        }
        
        let chars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        let randomChar = chars.randomElement()!
        
        var urlString = "https://api.edamam.com/search?q=\(randomChar)&app_id=\(APP_ID)&app_key=\(API_KEY)&to=50"
        
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
                        var cuisine = [String]()
                        var meal = [String]()
                        var dish = [String]()
                        
                        //recipe details
                        let calories = Int(Double(recipe["recipe"]["calories"].stringValue)!)
                        let totalWeight = Int(Double(recipe["recipe"]["totalWeight"].stringValue)!)
                        let title = recipe["recipe"]["label"].stringValue
                        let img = recipe["recipe"]["image"].stringValue
                        let servings = recipe["recipe"]["yield"].intValue
                        let healthLbls = recipe["recipe"]["healthLabels"].array
                        let dietLbls = recipe["recipe"]["dietLabels"].array
                        let ingred = recipe["recipe"]["ingredientLines"].array
                           
                        let cuisineType = recipe["recipe"]["cuisineType"].array
                        
                        let mealType = recipe["recipe"]["mealType"].array
                        
                        let dishType = recipe["recipe"]["dishType"].array
                        
                        let source = recipe["recipe"]["source"].stringValue
                        
                        if let cuisineTypes = cuisineType {
                            for i in cuisineTypes {
                                cuisine.append(i.stringValue)
                            }
                        }
                        
                        if let mealTypes = mealType {
                            for i in mealTypes {
                                meal.append(i.stringValue)
                            }
                        }
                        
                        if let dishTypes = dishType {
                            for i in dishTypes {
                                dish.append(i.stringValue)
                            }
                        }
                        
                        
                        
                        for i in healthLbls! {
                            health.append(i.stringValue)
                        }
                            
                        for i in dietLbls! {
                            diet.append(i.stringValue)
                        }
                            
                        for i in ingred! {
                            ingredients.append(i.stringValue)
                        }
                        
                        //extract nutrients info
                        if isTrending {
                            self.trendingNutrients.append(self.extractNutrient(recipe))
                        } else {
                            self.hotNutrients.append(self.extractNutrient(recipe))
                        }
                        
                            
                        let result = Recipe(title: title, img: img, calories: calories, totalWeight: totalWeight, dietLabels: diet, healthLabel: health, ingredients: ingredients, isFavorite: false, servings: servings, source: source, cuisineType: cuisine, mealType: meal, dishType: dish)
                         
                        if isTrending {
                            self.trendingRecipes.append(result)
                        } else {
                            self.hotRecipes.append(result)
                        }
                            
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
                            var cuisine = [String]()
                            var meal = [String]()
                            var dish = [String]()
                            
                            let calories = Int(Double(recipe["recipe"]["calories"].stringValue)!)
                            let totalWeight = Int(Double(recipe["recipe"]["totalWeight"].stringValue)!)
                            let title = recipe["recipe"]["label"].stringValue
                            let img = recipe["recipe"]["image"].stringValue
                            let servings = recipe["recipe"]["yield"].intValue
                            let healthLbls = recipe["recipe"]["healthLabels"].array
                            let dietLbls = recipe["recipe"]["dietLabels"].array
                            let ingred = recipe["recipe"]["ingredientLines"].array
                            
                            let cuisineType = recipe["recipe"]["cuisineType"].array
                            
                            let mealType = recipe["recipe"]["mealType"].array
                            
                            let dishType = recipe["recipe"]["dishType"].array
                            
                            let source = recipe["recipe"]["source"].stringValue
                            
                            if let cuisineTypes = cuisineType {
                                for i in cuisineTypes {
                                    cuisine.append(i.stringValue)
                                }
                            }
                            
                            if let mealTypes = mealType {
                                for i in mealTypes {
                                    meal.append(i.stringValue)
                                }
                            }
                            
                            if let dishTypes = dishType {
                                for i in dishTypes {
                                    dish.append(i.stringValue)
                                }
                            }
                            
                            for i in healthLbls! {
                                health.append(i.stringValue)
                            }
                            
                            for i in dietLbls! {
                                diet.append(i.stringValue)
                            }
                            
                            for i in ingred! {
                                ingredients.append(i.stringValue)
                            }
                            
                            let result = Recipe(title: title, img: img, calories: calories, totalWeight: totalWeight, dietLabels: diet, healthLabel: health, ingredients: ingredients, isFavorite: false, servings: servings, source: source, cuisineType: cuisine, mealType: meal, dishType: dish)
                            
                            self.searchRecipes.append(result)
                            self.searchNutrients.append(self.extractNutrient(recipe))
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
    
    
    //Save user favorite recipes to user default
    func saveFavoriteRecipes(_ recipes: [Recipe]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(recipes) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "savedRecipes")
        }
    }
    
    //load saved recipes from user default
    func loadFavoriteRecipes()->[Recipe]{
        
        if let savedRecipes = UserDefaults.standard.object(forKey: "savedRecipes") as? Data {
            
            let decoder = JSONDecoder()
            if let loadedRecipes = try? decoder.decode([Recipe].self, from: savedRecipes){
                return loadedRecipes
            }
            return []
        } else {
            return []
        }
    }
    
    
    
}

extension DataService {
    
    func extractNutrient(_ recipe: JSON)->[Nutrient]{
        
        var nutrients = [Nutrient]()
        
        let calcium = recipe["recipe"]["totalNutrients"]["CA"]
        let carbs = recipe["recipe"]["totalNutrients"]["CHOCDF"]
        let cholesterol = recipe["recipe"]["totalNutrients"]["CHOLE"]
        let sugars = recipe["recipe"]["totalNutrients"]["SUGAR"]
        let fat = recipe["recipe"]["totalNutrients"]["FAT"]
        let trans = recipe["recipe"]["totalNutrients"]["FATRN"]
        let iron = recipe["recipe"]["totalNutrients"]["FE"]
        let potassium = recipe["recipe"]["totalNutrients"]["K"]
        let magnesium = recipe["recipe"]["totalNutrients"]["MG"]
        let sodium = recipe["recipe"]["totalNutrients"]["NA"]
        let vitaB6 = recipe["recipe"]["totalNutrients"]["VITB6A"]
        let energy = recipe["recipe"]["totalNutrients"]["ENERC_KCAL"]
        let protein = recipe["recipe"]["totalNutrients"]["PROCNT"]
        let saturated = recipe["recipe"]["totalNutrients"]["FASAT"]
        let vitaE = recipe["recipe"]["totalNutrients"]["TOCPHA"]
        let vitaA = recipe["recipe"]["totalNutrients"]["VITA_RAE"]
        let vitaC = recipe["recipe"]["totalNutrients"]["VITC"]
        let vitaD = recipe["recipe"]["totalNutrients"]["VITD"]
        let vitaK = recipe["recipe"]["totalNutrients"]["VITK1"]
        
        if calcium["label"].stringValue != "" {
            let calciumObj = Nutrient(label: calcium["label"].stringValue, quantity:String(format: "%.4f", calcium["quantity"].double!), unit: calcium["unit"].stringValue)
            nutrients.append(calciumObj)
        }
        
        if carbs["label"].stringValue != "" {
            let carbsObj = Nutrient(label: carbs["label"].stringValue, quantity:String(format: "%.4f", carbs["quantity"].double!), unit: carbs["unit"].stringValue)
            nutrients.append(carbsObj)
        }
        
        if cholesterol["label"].stringValue != "" {
            let cholesterolObj = Nutrient(label: cholesterol["label"].stringValue, quantity:String(format: "%.4f", cholesterol["quantity"].double!), unit: cholesterol["unit"].stringValue)
            nutrients.append(cholesterolObj)
        }
        
        if sugars["label"].stringValue != "" {
            let sugarsObj = Nutrient(label: sugars["label"].stringValue, quantity:String(format: "%.4f", sugars["quantity"].double!), unit: sugars["unit"].stringValue)
            nutrients.append(sugarsObj)
        }
        
        if fat["label"].stringValue != "" {
            let fatObj = Nutrient(label: fat["label"].stringValue, quantity:String(format: "%.4f", fat["quantity"].double!), unit: fat["unit"].stringValue)
            nutrients.append(fatObj)
        }
        
        if trans["label"].stringValue != "" {
            let transObj = Nutrient(label: trans["label"].stringValue, quantity:String(format: "%.4f", trans["quantity"].double!), unit: trans["unit"].stringValue)
            nutrients.append(transObj)
        }
        
        if iron["label"].stringValue != "" {
            let ironObj = Nutrient(label: iron["label"].stringValue, quantity:String(format: "%.4f", iron["quantity"].double!), unit: iron["unit"].stringValue)
            nutrients.append(ironObj)
        }
        
        if potassium["label"].stringValue != "" {
            let potassiumObj = Nutrient(label: potassium["label"].stringValue, quantity:String(format: "%.4f", potassium["quantity"].double!), unit: potassium["unit"].stringValue)
            nutrients.append(potassiumObj)
        }
        
        if magnesium["label"].stringValue != "" {
            let magnesiumObj = Nutrient(label: magnesium["label"].stringValue, quantity:String(format: "%.4f", magnesium["quantity"].double!), unit: magnesium["unit"].stringValue)
            nutrients.append(magnesiumObj)
        }
        
        if sodium["label"].stringValue != "" {
            let sodiumObj = Nutrient(label: sodium["label"].stringValue, quantity:String(format: "%.4f", sodium["quantity"].double!), unit: sodium["unit"].stringValue)
            nutrients.append(sodiumObj)
        }
        
        if vitaB6["label"].stringValue != "" {
            let vitaB6Obj = Nutrient(label: vitaB6["label"].stringValue, quantity:String(format: "%.4f", vitaB6["quantity"].double!), unit: vitaB6["unit"].stringValue)
            nutrients.append(vitaB6Obj)
        }
        
        if energy["label"].stringValue != "" {
            let energyObj = Nutrient(label: energy["label"].stringValue, quantity:String(format: "%.4f", energy["quantity"].double!), unit: energy["unit"].stringValue)
            nutrients.append(energyObj)
        }
        
        if protein["label"].stringValue != "" {
            let proteinObj = Nutrient(label: protein["label"].stringValue, quantity:String(format: "%.4f", protein["quantity"].double!), unit: protein["unit"].stringValue)
            nutrients.append(proteinObj)
        }
        
        if saturated["label"].stringValue != "" {
            let saturatedObj = Nutrient(label: saturated["label"].stringValue, quantity:String(format: "%.4f", saturated["quantity"].double!), unit: saturated["unit"].stringValue)
            nutrients.append(saturatedObj)
            
        }
        
        if vitaA["label"].stringValue != "" {
            let vitaAObj = Nutrient(label: vitaA["label"].stringValue, quantity:String(format: "%.4f", vitaA["quantity"].double!), unit: vitaA["unit"].stringValue)
            nutrients.append(vitaAObj)
        }
        
        if vitaC["label"].stringValue != "" {
            let vitaCObj = Nutrient(label: vitaC["label"].stringValue, quantity:String(format: "%.4f", vitaC["quantity"].double!), unit: vitaC["unit"].stringValue)
            nutrients.append(vitaCObj)
        }
        
        if vitaD["label"].stringValue != "" {
            let vitaDObj = Nutrient(label: vitaD["label"].stringValue, quantity:String(format: "%.4f", vitaD["quantity"].double!), unit: vitaD["unit"].stringValue)
            nutrients.append(vitaDObj)
            
        }
        
        if vitaK["label"].stringValue != "" {
            let vitaKObj = Nutrient(label: vitaK["label"].stringValue, quantity:String(format: "%.4f", vitaK["quantity"].double!), unit: vitaK["unit"].stringValue)
            nutrients.append(vitaKObj)
        }
        
        if vitaE["label"].stringValue != "" {
            let vitaEObj = Nutrient(label: vitaE["label"].stringValue, quantity:String(format: "%.4f", vitaE["quantity"].double!), unit: vitaE["unit"].stringValue)
            nutrients.append(vitaEObj)
        }
        
        
        return nutrients
        
    }
    
}
