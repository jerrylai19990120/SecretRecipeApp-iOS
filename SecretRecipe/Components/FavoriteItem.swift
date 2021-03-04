//
//  FavoriteItem.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct FavoriteItem: View {
    
    var gr: GeometryProxy
    
    var img = "sample1"
    
    var rating = "4.6"
    
    var cookTime = "26 mins"
    
    var difficulty = "easy"
    
    var body: some View {
        VStack(spacing: 16) {
            Image(img)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.92, height: gr.size.height*0.3)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                
                Text("California Pasta")
                    .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                
                Text("Easy, quick and yet so delicious!")
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(rating)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text(cookTime)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.orange)
                        Text(difficulty)
                    }
                }.padding([.leading, .trailing])
                .frame(width: gr.size.width*0.92)
                
            }.padding([.leading, .trailing])
            .frame(width: gr.size.width*0.92)
            
        }
        
    }
}

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            FavoriteItem(gr: gr)
        }
        
    }
}
