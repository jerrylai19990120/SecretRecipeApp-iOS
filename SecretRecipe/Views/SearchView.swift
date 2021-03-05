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
            
            TitleBar(gr: gr)
            
            SearchBar(gr: gr, query: $query)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    CategoryRow(gr: gr, cate1: "Quickly", cate2: "Breakfast", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "steak", img2: "pasta")
                    
                    
                    CategoryRow(gr: gr, cate1: "Desert", cate2: "Lunch", color1: Color(red: 248/255, green: 164/255, blue: 147/255), color2: Color(red: 207/255, green: 172/255, blue: 220/255), img1: "desert", img2: "meat")
                    
                    
                    CategoryRow(gr: gr, cate1: "Salad", cate2: "Dinner", color1: Color(red: 122/255, green: 210/255, blue: 186/255), color2: Color(red: 245/255, green: 207/255, blue: 145/255), img1: "pasta2", img2: "pasta2")
                    
                    
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

struct CategoryRow: View {
    
    var gr: GeometryProxy
    
    var cate1: String
    
    var cate2: String
    
    var color1: Color
    
    var color2: Color
    
    var img1: String
    
    var img2: String
    
    var body: some View {
        HStack {
            NavigationLink(destination: CategoryView(gr: gr, category: cate1).navigationBarTitle("").navigationBarHidden(true)) {
                CategoryItem(gr: gr, color: color1, img: img1, category: cate1)
            }
            
            Spacer()
            
            NavigationLink(destination: CategoryView(gr: gr, category: cate2).navigationBarTitle("").navigationBarHidden(true)) {
                CategoryItem(gr: gr, color: Color(red: 189/255, green: 232/255, blue: 254/255), img: img2, category: cate2)
            }
            
            
        }.padding([.top, .leading, .trailing])
    }
}

struct TitleBar: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            Text("What to eat?")
                .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
            Spacer()
        }
    }
}

struct SearchBar: View {
    
    var gr: GeometryProxy
    
    @Binding var query: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: gr.size.width*0.04))
                .foregroundColor(.green)
            
            TextField("Search", text: $query)
            
        }.padding(.all, gr.size.width*0.026)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.init(white: 0.8), lineWidth: 1))
    }
}
