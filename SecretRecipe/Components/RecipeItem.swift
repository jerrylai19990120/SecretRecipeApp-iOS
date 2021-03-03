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
    
    var img = "example"
    
    var title = "Wellington Steak"
    
    var cookTime = "30 mins"
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    Text(title)
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                        .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                    Spacer()
                    Spacer()
                    Text("Cooking Time:")
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                        .foregroundColor(.gray)
                    Text(cookTime)
                        .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                        .foregroundColor(.green)
                }
                Spacer()
            }.padding()
                .frame(width: gr.size.width*0.8, height: gr.size.height*0.20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init(white: 0.8), lineWidth: 1))
            
            Image(img)
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
