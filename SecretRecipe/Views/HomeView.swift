//
//  HomeView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    @State var hots: [Recipe] = []
    
    @State var trends: [Recipe] = []
    
    @State var selection: Int?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.36)
                HStack {
                    Image("forkBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .rotationEffect(.degrees(45))
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("pizzaBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .offset(y: -gr.size.height*0.028)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.08)
                
                Text("What's New?")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.07)
                    
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    SubHeader(gr: gr, color: color, title: "Trends", subtitle: "View All")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if self.trends.count != 0 {
                                if self.trends.count <= 10 {
                                    ForEach(0..<self.trends.count, id: \.self){
                                        i in
                                        NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.trends[i], nutrients: DataService.instance.trendingNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.trends[i].isFavorite, recipe: self.trends[i])), tag: i, selection: self.$selection) {
                                            Button(action: {
                                                self.selection = i
                                               
                                            }) {
                                                LargeBanner(gr: self.gr, img: self.trends[i].img, title: self.trends[i].title, description: self.trends[i].healthLabel[0], calories: self.trends[i].calories, weight: self.trends[i].totalWeight, serving: self.trends[i].servings).padding(.bottom,self.gr.size.height*0.11)
                                                    .padding(.trailing)
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
                                                LargeBanner(gr: self.gr, img: self.trends[i].img, title: self.trends[i].title, description: self.trends[i].healthLabel[0], calories: self.trends[i].calories, weight: self.trends[i].totalWeight, serving: self.trends[i].servings).padding(.bottom,self.gr.size.height*0.11)
                                                    .padding(.trailing)
                                            }
                                        }.accentColor(.black)
                                        
                                    }
                                }
                                
                            }
                        
                            
                        }.padding(.leading)
                    }
                    SubHeader(gr: gr, color: color, title: "Hot Recipes", subtitle: "More")
                    
                    
                    VStack(alignment: .leading, spacing: gr.size.height*0.04) {
                        if self.hots.count != 0 {
                            if self.hots.count <= 10 {
                                ForEach(0..<self.hots.count, id: \.self){
                                    i in
                                    
                                    NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.hots[i], nutrients: DataService.instance.hotNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.hots[i].isFavorite, recipe: self.hots[i])), tag: -i, selection: self.$selection) {
                                        Button(action: {
                                            self.selection = -i
                                            
                                        }) {
                                            DailyHotRecipe(gr: self.gr, title: self.hots[i].title, desc: self.hots[i].healthLabel.joined(separator: ", "), img: self.hots[i].img)
                                        }
                                    }.accentColor(.black)
                                }
                            } else {
                                ForEach(0...9, id: \.self){
                                    i in
                                    NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.hots[i], nutrients: DataService.instance.hotNutrients[i]).navigationBarItems(trailing: LikeButton(gr: self.gr, isFavorite: self.hots[i].isFavorite, recipe: self.hots[i])), tag: -(i+10), selection: self.$selection) {
                                        Button(action: {
                                            self.selection = -(i + 10)
                                        }) {
                                            DailyHotRecipe(gr: self.gr, title: self.hots[i].title, desc: self.hots[i].healthLabel.joined(separator: ", "), img: self.hots[i].img)
                                        }
                                    }.accentColor(.black)
                                    
                                }
                            }
                            
                        }
                            
                    }.padding(.bottom, gr.size.height*0.05)
                    
                }.padding()
            }
            
        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
        .onAppear {
            DataService.instance.getHotAndTrending(isTrending: true) { (success) in
                self.trends = []
                self.trends = DataService.instance.trendingRecipes
                
            }
            DataService.instance.getHotAndTrending(isTrending: false) { (success) in
                self.hots = []
                self.hots = DataService.instance.hotRecipes
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeView(gr: gr)
        }
    }
}

struct SubHeader: View {
    
    var gr: GeometryProxy
    
    var color: Color
    
    var title: String
    
    var subtitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: gr.size.width*0.072, weight: .semibold, design: .default))
            Spacer()
            HStack(spacing: 2) {
                NavigationLink(destination: compare(title: title, gr: gr)) {
                    Text(subtitle)
                        .foregroundColor(color)
                        .fontWeight(.medium)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(color)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.036, height: gr.size.width*0.036)
                }
                
            }
        }.padding([.leading, .trailing])
    }
    
    func compare(title: String, gr: GeometryProxy) -> some View {
        if title == "Trends"{
            return AnyView(TrendsView(gr: gr).navigationBarTitle("").navigationBarHidden(true))
        } else {
            return AnyView(HotRecipesView(gr: gr).navigationBarTitle("").navigationBarHidden(true))
        }
    }
}
