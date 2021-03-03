//
//  LargeBanner.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct LargeBanner: View {
    
    var gr: GeometryProxy
    
    var img = "sample1"
    
    var title = "Delicious Healthy Pasta"
    
    var description = "Quick & Easy"
    
    var rating = "4.6"
    
    var cookTime = "26 mins"
    
    var difficulty = "easy"
    
    var body: some View {
        ZStack {
            Image(img).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.8, height: gr.size.height*0.3)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text(title)
                    .font(.system(size: gr.size.width*0.043, weight: .medium, design: .rounded))
                Text(description)
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.043, weight: .medium, design: .rounded))
                Rectangle().fill(Color.gray).frame(width: gr.size.width*0.57, height: 1)
                    .padding([.top, .bottom],4)
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(rating)
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text(cookTime)
                    }
                    HStack {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.orange)
                        Text(difficulty)
                    }
                }
            }.padding()
            .padding([.leading, .trailing])
            .background(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.96))
            .cornerRadius(20)
            .shadow(radius: 3)
                .offset(y: gr.size.height*0.15)
            
            
                
            
            }
    }
}

struct LargeBanner_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            LargeBanner(gr: gr)
        }
        
    }
}
