//
//  RecipeDetailView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var gr: GeometryProxy
    
    var recipe: Recipe = Recipe(title: "No info", img: "", calories: 0, totalWeight: 0, dietLabels: [""], healthLabel: [""], ingredients: [""], isFavorite: false, servings: 0, source: "", cuisineType: [], mealType: [], dishType: [])
    
    var nutrients: [Nutrient] = [Nutrient(label: "", quantity: "", unit: "")]
    
    @State var selection = -1
    
    @State var popup: Bool = false
    
    @State var isFavorite = false
    
    @State var tag: Int?
    
    @State var customImg: UIImage = UIImage(named: "logo")!
    
    var body: some View {
        ZStack {
            
            VStack {
                
                ZStack {
                    Image(uiImage: customImg)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: gr.size.width, height: gr.size.height*0.5)
                    
                    
                    /*VStack {
                        
                        HStack {
                            NavigationLink(destination: TabNavView(selectionIndex: 0).navigationBarTitle("").navigationBarHidden(true), tag: 1, selection: $tag) {
                                
                                Button(action: {
                                    self.tag = 1
                                    self.popup.toggle()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                        .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                                }
                                
                            }.accentColor(.black)
                            
                                
                            Spacer()
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                                .onTapGesture {
                                    self.isFavorite.toggle()
                                    var favors = DataService.instance.loadFavoriteRecipes()
                                    favors.append(self.recipe)
                                    DataService.instance.saveFavoriteRecipes(favors)
                            }
                        }.padding(.top, gr.size.height*0.1)
                        
                        Spacer()
                    }.padding()*/
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 248/255, green: 251/255, blue: 254/255))
                        .frame(height: gr.size.height*0.6)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.4)
                        
                    
                    DetailComponent(gr: gr, recipe: self.recipe, nutrients: self.nutrients).padding(.top, 40)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.18)
                        
                }.animation(.default)
                
                

            }
            
        }.padding(.top, gr.size.height*0.46)
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.popup = true
            self.loadImage(imgUrl: self.recipe.img) { (success) in
                    
            }
        }
        .onDisappear {
            self.popup = false
        }
        
    }
    
    
    func loadImage(imgUrl: String, completion: @escaping (_ status: Bool)->()) {
        
        let urlString = imgUrl.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data else {
                completion(false)
                return
            }
            
            DispatchQueue.main.async {
                guard let img = UIImage(data: data) else {
                    completion(false)
                    return
                }
                self.customImg = img
                completion(true)
            }
        }
               
        task.resume()

    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeDetailView(gr: gr)
        }
        
    }
}
