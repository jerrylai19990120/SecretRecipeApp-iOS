//
//  HotRecipesView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-04.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HotRecipesView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.3)
                HStack {
                    Image("forkBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.12, height: gr.size.width*0.12)
                        .rotationEffect(.degrees(45))
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("pancakeBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                        .offset(y: -gr.size.height*0.01)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.1)
                
                Text("Hot Recipes")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.1)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    FavoriteItem(gr: gr)
                    FavoriteItem(gr: gr)
                }.padding(.top)
            }
        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
    }
}

struct HotRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HotRecipesView(gr: gr)
        }
    }
}
