//
//  FavoriteView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    @State var popup = false
    
    @State var tag: Int?
    
    @State var favorites = [Recipe]()
    
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
                    Image("pancakeBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .offset(y: -gr.size.height*0.028)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.08)
                
                Text("Favorite Cuisine")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.07)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: gr.size.height*0.03) {
                    
                    if self.favorites.count == 0 {
                        Text("You haven't add any recipes at the moment")
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                            .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                            .padding()
                        
                        Image("logo")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gr.size.width*0.54, height: gr.size.width*0.54)
                    } else {
                        ForEach(0..<self.favorites.count, id: \.self){
                            i in
                            NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: self.favorites[i], popup: self.$popup).navigationBarTitle("").navigationBarHidden(true), tag: i, selection: self.$tag) {
                                Button(action: {
                                    self.tag = i
                                    self.popup.toggle()
                                }) {
                                    FavoriteItem(gr: self.gr, title: self.favorites[i].title, desc: self.favorites.count != 0 ? self.favorites[i].healthLabel[0] : "Click to view recipe", img: self.favorites[i].img, calories: self.favorites[i].calories, weight: self.favorites[i].totalWeight, servings: self.favorites[i].servings)
                                }
                            }.accentColor(.black)
                        }

                    }
                    

                }.padding(.top).frame(width: gr.size.width)
            }.padding(.bottom, gr.size.height*0.05)

        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
            .onAppear {
                self.favorites = []
                self.favorites = DataService.instance.loadFavoriteRecipes()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            FavoriteView(gr: gr)
        }
    }
}
