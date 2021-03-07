//
//  TrendsView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-04.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TrendsView: View {
    
    var gr: GeometryProxy
    
    var color = Color(red: 255/255, green: 195/255, blue: 60/255)
    
    @State var trends: [Recipe] = [Recipe(title: "no info", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: ["no info"], ingredients: [""], isFavorite: false, servings: 0)]
    
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(color)
                    .frame(width: gr.size.width, height: gr.size.height*0.3)
                HStack {
                    NavigationLink(destination: TabNavView(selectionIndex: 0).navigationBarTitle("").navigationBarHidden(true)) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                    }
                    
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
                        .offset(y: gr.size.height*0.01)
                    Spacer()
                }.padding()
                .offset(y: gr.size.height*0.1)
                
                Text("Trending Now")
                    .foregroundColor(.white)
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.08))
                    .offset(y: gr.size.height*0.1)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if self.trends.count != 0 {
                        ForEach(self.trends, id: \.self){
                            item in
                            FavoriteItem(gr: self.gr, title: item.title, desc: item.healthLabel[0], img: item.img, calories: item.calories, weight: item.totalWeight, servings: item.servings)
                        }
                    }
                }.padding(.top)
            }
            
        }.offset(y: -gr.size.height*0.12)
        .frame(height: gr.size.height+gr.size.height*0.12)
            .onAppear {
                DataService.instance.getHotAndTrending(isTrending: true) { (success) in
                    
                }
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            TrendsView(gr: gr)
        }
    }
}
