//
//  FavoriteView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    @State var popup = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.3)
                HStack {
                    Image("forkBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .rotationEffect(.degrees(45))
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("pancakeBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .offset(y: -gr.size.height*0.028)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.08)
                
                Text("Favorite Cuisine")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.07)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: gr.size.height*0.03) {
                    
                    
                    NavigationLink(destination: RecipeDetailView(gr: gr, popup: $popup).navigationBarTitle("").navigationBarHidden(true), isActive: $popup) {
                        Button(action: {
                            self.popup.toggle()
                        }) {
                            FavoriteItem(gr: gr, img: "sample1")
                        }
                    }.accentColor(.black)
                    
                    FavoriteItem(gr: gr, img: "sample2")
                    FavoriteItem(gr: gr, img: "sample3")
                    FavoriteItem(gr: gr, img: "sample4")
                }.padding(.top)
            }

        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            FavoriteView(gr: gr)
        }
    }
}
