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
                Text("Feature Recipes")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    BannerCategory(gr: gr).padding()
                    BannerCategory(gr: gr).padding([.trailing, .top, .bottom])
                    BannerCategory(gr: gr).padding([.trailing, .top, .bottom])
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
