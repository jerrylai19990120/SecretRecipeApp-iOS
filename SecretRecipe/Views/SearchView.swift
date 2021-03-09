//
//  SearchView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State var query = ""
    
    var gr: GeometryProxy
    
    @State var results = [Recipe]()
    
    @State var selection: Int?
    
    var body: some View {
        VStack {
            
            TitleBar(gr: gr)
            
            SearchBar(gr: gr, query: $query, results: $results)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    if query == "" {
                        ForEach(DataService.instance.categories, id: \.self){ item in
                            CategoryRow(gr: self.gr, cate1: item.cate1, cate2: item.cate2, color1: item.color1, color2: item.color2, img1: item.img1, img2: item.img2, index1: item.index1, index2: item.index2)
                        }
                    } else {
                        ForEach(0..<self.results.count, id: \.self) {
                            i in
                            NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.results[i], nutrients: DataService.instance.searchNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.results[i].isFavorite, recipe: self.results[i])), tag: i, selection: self.$selection) {
                                
                                Button(action: {
                                    self.selection = i
                                    //self.popup.toggle()
                                }) {
                                    RecipeItem(gr: self.gr, img: self.results[i].img, title: self.results[i].title, calories: "\(self.results[i].calories)")
                                }
                            }
                            
                        }
                    }
                    
                    
                    
                }.padding(.bottom)
            }.padding(.bottom, gr.size.height*0.09)
            
        }.padding([.top, .leading, .trailing])
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            SearchView(gr: gr)
        }
    }
}

struct CategoryRow: View {
    
    var gr: GeometryProxy
    
    var cate1: String
    
    var cate2: String
    
    var color1: Color
    
    var color2: Color
    
    var img1: String
    
    var img2: String
    
    var index1: Int
    
    var index2: Int
    
    @State var tag: Int?
    
    var body: some View {
        HStack {
            NavigationLink(destination: CategoryView(gr: gr, category: cate1).navigationBarTitle("").navigationBarHidden(true), tag: self.index1, selection: self.$tag) {
                Button(action: {
                    DataService.instance.getRecipesByCategory(self.cate1) { (success) in
                        if success {
                            self.tag = self.index1
                        }
                    }
                }) {
                    CategoryItem(gr: gr, color: color1, img: img1, category: cate1)
                }
               
            }
            
            
            Spacer()
            
            NavigationLink(destination: CategoryView(gr: gr, category: cate2).navigationBarTitle("").navigationBarHidden(true), tag: self.index2, selection: self.$tag) {
                Button(action: {
                    DataService.instance.getRecipesByCategory(self.cate2) { (success) in
                        if success {
                            self.tag = self.index2
                        }
                        
                    }
                }) {
                    CategoryItem(gr: gr, color: color2, img: img2, category: cate2)
                }
               
            }
            
            
        }.padding([.top, .leading, .trailing])
    }
}

struct TitleBar: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            Text("What to eat?")
                .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
            Spacer()
        }
    }
}

struct SearchBar: View {
    
    var gr: GeometryProxy
    
    @Binding var query: String
    
    @Binding var results: [Recipe]
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: gr.size.width*0.04))
                .foregroundColor(.green)
            
            TextField("Search", text: $query, onEditingChanged: { (success) in
                
            }) {
                DataService.instance.getSearchRecipe(self.query) { (done) in
                    if done {
                        self.results = []
                        self.results = DataService.instance.searchRecipes
                    }
                }
            }
            
        }.padding(.all, gr.size.width*0.026)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.init(white: 0.8), lineWidth: 1))
    }
}
