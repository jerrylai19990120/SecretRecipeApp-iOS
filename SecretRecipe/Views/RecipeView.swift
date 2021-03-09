//
//  RecipeView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    
    @State var query = ""
    
    var gr: GeometryProxy
    
    @State var trends: [Recipe] = []
    
    @State var selection: Int?
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Recipes Collections")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                Spacer()
            }.padding(.top)
            //Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(DataService.instance.categories, id: \.self){
                        item in
                        HStack {
                            BannerCategory(gr: self.gr, color: item.color1, img: item.img1, category: item.cate1, index: item.index1).padding()
                            
                            BannerCategory(gr: self.gr, color: item.color2, img: item.img2, category: item.cate2, index: item.index2).padding()
                        }
                        
                        

                    }
                    
                    
                }
            }.padding([.top, .bottom])
            Divider().padding(.bottom, gr.size.width*0.026)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if self.trends.count != 0 {
                        if self.trends.count <= 10 {
                            ForEach(0..<self.trends.count, id: \.self){
                                i in
                                NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.trends[i], nutrients: DataService.instance.trendingNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.trends[i].isFavorite, recipe: self.trends[i])), tag: i, selection: self.$selection) {
                                    Button(action: {
                                        self.selection = i
                                        
                                    }) {
                                        RecipeItem(gr: self.gr, img: self.trends[i].img, title: self.trends[i].title, calories: "\(self.trends[i].calories)")
                                    }
                                }.accentColor(.black)
                                
                            }
                        } else {
                            
                            ForEach(0...9, id: \.self){
                                i in
                                NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.trends[i], nutrients: DataService.instance.trendingNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.trends[i].isFavorite, recipe: self.trends[i])), tag: i+10, selection: self.$selection) {
                                    Button(action: {
                                        self.selection = i + 10
                                        
                                    }) {
                                        RecipeItem(gr: self.gr, img: self.trends[i].img, title: self.trends[i].title, calories: "\(self.trends[i].calories)")
                                    }
                                }.accentColor(.black)
                                
                                
                            }
                        }
                        
                    }
                    
                }.frame(width: gr.size.width)
            }.padding(.bottom, gr.size.height*0.1)
            .padding(.top)
            .frame(width: gr.size.width)
           
        }.onAppear {
            DataService.instance.getHotAndTrending(isTrending: true) { (success) in
                self.trends = []
                self.trends = DataService.instance.trendingRecipes
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeView(gr: gr)
        }
        
    }
}
