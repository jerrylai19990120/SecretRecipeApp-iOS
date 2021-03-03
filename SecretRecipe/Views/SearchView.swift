//
//  SearchView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State var query = ""
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("What to eat?")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                Spacer()
            }
            
            HStack {
                Image(systemName: "magnifyingglass")
                .font(.system(size: gr.size.width*0.04))
                    .foregroundColor(.green)
                
                TextField("Search", text: $query)
                
            }.padding(.all, gr.size.width*0.026)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.init(white: 0.8), lineWidth: 1))
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        CategoryItem(gr: gr, color: Color(red: 253/255, green: 228/255, blue: 151/255), img: "steak", category: "Quickly")
                        Spacer()
                        CategoryItem(gr: gr, color: Color(red: 189/255, green: 232/255, blue: 254/255), img: "pasta", category: "Breakfast")
                    }.padding([.top, .leading, .trailing])
                    
                    HStack {
                        CategoryItem(gr: gr, color: Color(red: 248/255, green: 164/255, blue: 147/255), img: "desert", category: "Desert")
                        Spacer()
                        CategoryItem(gr: gr, color: Color(red: 207/255, green: 172/255, blue: 220/255), img: "meat", category: "lunch")
                    }.padding([.leading, .trailing])
                    
                    
                    HStack {
                        CategoryItem(gr: gr, color: Color(red: 122/255, green: 210/255, blue: 186/255), img: "pasta2", category: "Salad")
                        Spacer()
                        CategoryItem(gr: gr, color: Color(red: 245/255, green: 207/255, blue: 145/255), img: "pasta2", category: "Dinner")
                    }.padding([.leading, .trailing])
                }
            }
            
        }.padding()
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            SearchView(gr: gr)
        }
    }
}
