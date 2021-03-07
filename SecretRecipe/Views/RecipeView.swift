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
            }.padding(.top)
            //Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(DataService.instance.categories, id: \.self){
                        item in
                        BannerCategory(gr: self.gr, color: item.color1, img: "2", category: item.cate1).padding()

                    }
                    
                    
                }
            }.padding([.top, .bottom])
            Divider().padding(.bottom, gr.size.width*0.026)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("")
                    /*RecipeItem(gr: gr, img: "1")
                    RecipeItem(gr: gr, img: "2")
                    RecipeItem(gr: gr, img: "3")
                    RecipeItem(gr: gr, img: "4")
                    RecipeItem(gr: gr, img: "5")
                    RecipeItem(gr: gr, img: "6")*/
                }.frame(width: gr.size.width)
            }.padding(.bottom, gr.size.height*0.09)
            .frame(width: gr.size.width)
           
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
