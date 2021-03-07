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
    
     @State var trends: [Recipe] = [Recipe(title: "no info", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: ["no info"], ingredients: [""], isFavorite: false, servings: 0)]
    
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
                        ForEach(self.trends, id: \.self){
                            item in
                            RecipeItem(gr: self.gr, img: item.img, title: item.title, calories: "\(item.calories)")
                        }
                    }
                    
                }.frame(width: gr.size.width)
            }
            .padding([.top, .bottom])
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
