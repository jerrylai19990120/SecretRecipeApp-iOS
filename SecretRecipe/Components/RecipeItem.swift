//
//  RecipeItem.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct RecipeItem: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Seafood Salad")
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    Spacer()
                    Spacer()
                    Text("Cooking Time:")
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                        .foregroundColor(.gray)
                    Text("30 mins")
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                        .foregroundColor(.green)
                }
                Spacer()
            }.padding()
                .frame(width: gr.size.width*0.8, height: gr.size.height*0.20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init(white: 0.8), lineWidth: 1))
            
            Image("example")
            .resizable().renderingMode(.original)
            .frame(width: gr.size.width*0.3, height: gr.size.height*0.23)
            .offset(x: -gr.size.width*0.28)
            .shadow(radius: 6)
            
        }
    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeItem(gr: gr)
        }
        
    }
}
