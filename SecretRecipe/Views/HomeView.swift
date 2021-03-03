//
//  HomeView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.36)
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
                    Image("pizzaBg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                        .offset(y: -gr.size.height*0.028)
                    Spacer()
                }.padding()
                    .offset(y: gr.size.height*0.08)
                
                Text("What's New?")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.07)
                    
            }
            VStack{
                SubHeader(gr: gr, color: color, title: "Trends", subtitle: "View All")
                SubHeader(gr: gr, color: color, title: "Hot Recipes", subtitle: "More")
            }.padding()
        }.offset(y: -gr.size.height*0.18)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeView(gr: gr)
        }
    }
}

struct SubHeader: View {
    
    var gr: GeometryProxy
    
    var color: Color
    
    var title: String
    
    var subtitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: gr.size.width*0.072, weight: .semibold, design: .default))
            Spacer()
            HStack(spacing: 2) {
                Text(subtitle)
                    .foregroundColor(color)
                    .fontWeight(.medium)
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(color)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.036, height: gr.size.width*0.036)
            }
        }.padding([.leading, .trailing])
    }
}
