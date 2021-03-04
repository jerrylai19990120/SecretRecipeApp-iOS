//
//  DetailComponent.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DetailComponent: View {
    
    var gr: GeometryProxy
    
    @State var selection = -1
    
    var rating = "4.6"
    
    var cookTime = "26 mins"
    
    var difficulty = "easy"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("California Pasta")
                .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                .padding(.leading)
                
            Text("Easy, quick and yet so delicious!")
                .font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .padding(.top, 8)
                .padding(.leading)
            
            HStack(spacing: gr.size.width*0.08) {
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
            }.padding([.bottom, .leading, .trailing])
            
            CustomTopTabBar(gr: gr, selection: $selection)
            
            if selection == -1 {
                Introduction(gr: gr)
                
            }
            
            if selection == 0 {
                Ingredients(gr: gr)
            }
            
            if selection == 1 {
                Preparations(gr: gr)
            }
            
            
        }.frame(width: gr.size.width)
    }
}

struct DetailComponent_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DetailComponent(gr: gr)
        }
    }
}
