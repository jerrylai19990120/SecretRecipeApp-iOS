//
//  HotRecipesView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-04.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HotRecipesView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    @State var hots: [Recipe] = [Recipe(title: "no info", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: ["no info"], ingredients: [""], isFavorite: false, servings: 0, source: "", cuisineType: [], mealType: [], dishType: [])]
    
    @State var popup = false
    
    @State var selection: Int?
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.3)
                HStack {
                    NavigationLink(destination: TabNavView(selectionIndex: 0).navigationBarTitle("").navigationBarHidden(true)) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                    }
                    
                    
                    Image("forkBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.12, height: gr.size.width*0.12)
                        .rotationEffect(.degrees(45))
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("pancakeBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                        .offset(y: -gr.size.height*0.01)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.1)
                
                Text("Hot Recipes")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.1)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if self.hots.count != 0 {
                        ForEach(0..<self.hots.count, id: \.self){
                            i in
                            NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.hots[i], nutrients: DataService.instance.hotNutrients[i], popup: self.$popup).navigationBarTitle("").navigationBarHidden(true), tag: i, selection: self.$selection) {
                                Button(action: {
                                    self.selection = i
                                    self.popup.toggle()
                                }) {
                                    FavoriteItem(gr: self.gr, title: self.hots[i].title, desc: self.hots[i].healthLabel[0], img: self.hots[i].img, calories: self.hots[i].calories, weight: self.hots[i].totalWeight, servings: self.hots[i].servings)
                                }
                            }.accentColor(.black)
                                
                                
                            
                            
                        }
                    }
                    
                }.padding(.top)
            }
        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
            .onAppear {
                DataService.instance.getHotAndTrending(isTrending: false) { (success) in
                    self.hots = []
                    self.hots = DataService.instance.hotRecipes
                }
        }
    }
}

struct HotRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HotRecipesView(gr: gr)
        }
    }
}
