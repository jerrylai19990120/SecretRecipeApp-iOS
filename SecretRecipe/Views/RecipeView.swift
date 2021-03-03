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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Recipes Collections")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                Spacer()
            }
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    BannerCategory(gr: gr, color: Color(red: 253/255, green: 228/255, blue: 151/255), img: "2", category: "Quickly: some quick recipes").padding()
                    BannerCategory(gr: gr, color: Color(red: 189/255, green: 232/255, blue: 254/255), img: "1", category: "Desert: Enjoy the Sweets").padding([.trailing, .top, .bottom])
                    BannerCategory(gr: gr, color: Color(red: 248/255, green: 164/255, blue: 147/255), img: "3", category: "Salad: Find inner green").padding([.trailing, .top, .bottom])
                    BannerCategory(gr: gr, color: Color(red: 207/255, green: 172/255, blue: 220/255), img: "4", category: "Breakfast: scramble eggs?").padding([.trailing, .top, .bottom])
                    BannerCategory(gr: gr, color: Color(red: 122/255, green: 210/255, blue: 186/255), img: "5", category: "Lunch: Hungry yet?").padding([.trailing, .top, .bottom])
                    BannerCategory(gr: gr, color: Color(red: 245/255, green: 207/255, blue: 145/255), img: "6", category: "Dinner: Much more options").padding([.trailing, .top, .bottom])
                }
            }.padding()
            Divider().padding(.bottom, gr.size.width*0.026)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    RecipeItem(gr: gr)
                    RecipeItem(gr: gr)
                    RecipeItem(gr: gr)
                    RecipeItem(gr: gr)
                    RecipeItem(gr: gr)
                    RecipeItem(gr: gr)
                }.frame(width: gr.size.width)
            }.frame(width: gr.size.width)
           
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
