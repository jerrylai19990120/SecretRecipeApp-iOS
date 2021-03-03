//
//  BannerCategory.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BannerCategory: View {
    
    var gr: GeometryProxy
    
    var color: Color = Color(red: 248/255, green: 164/255, blue: 147/255)
    
    var img = "1"
    
    var category = "Vegetarian: Discover more"
    
    var body: some View {
        HStack {
            VStack {
                Text(category)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    .fontWeight(.thin)
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                Spacer()
                Button(action: {
                    
                }) {
                    VStack(spacing: 3) {
                        Text("View More")
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                            .fontWeight(.thin)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: gr.size.width*0.18, height: 1)
                    }.foregroundColor(Color(red: 83/255, green: 82/255, blue: 108/255))
                    
                }
            }.padding()
            Spacer()
            Image(img)
                .resizable()
                .renderingMode(.original)
                .frame(width: gr.size.width*0.20, height: gr.size.width*0.280)
            .padding()
        }.padding()
        .frame(width: gr.size.width*0.8, height: gr.size.height*0.21)
        .background(color)
        .cornerRadius(26)
        
    }
}

struct BannerCategory_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            gr in
            BannerCategory(gr: gr)
        }
        
    }
}
