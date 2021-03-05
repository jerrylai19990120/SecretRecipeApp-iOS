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
    
    var categories: [CategoryRowData] = [
        CategoryRowData(cate1: "Breakfast", cate2: "Lunch", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "breakfast", img2: "lunch"),
        CategoryRowData(cate1: "Dinner", cate2: "Snack", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "dinner", img2: "snack"),
        CategoryRowData(cate1: "Tea time", cate2: "Alcohol cocktail", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "tea", img2: "cocktails"),
        CategoryRowData(cate1: "Biscuits", cate2: "Bread", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "biscuits", img2: "bread"),
        CategoryRowData(cate1: "Cereals", cate2: "Condiments", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "cereals", img2: "condiments"),
        CategoryRowData(cate1: "Drinks", cate2: "Deserts", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "drinks", img2: "desert"),
        CategoryRowData(cate1: "Egg", cate2: "Mains", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "egg", img2: "main"),
        CategoryRowData(cate1: "Omelet", cate2: "Pancake", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "omelet", img2: "pancakeBg"),
        CategoryRowData(cate1: "Preps", cate2: "Preserve", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "preps", img2: "preserve"),
        CategoryRowData(cate1: "Salad", cate2: "Sandwiches", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "salad", img2: "sandwich"),
        CategoryRowData(cate1: "Soup", cate2: "Starters", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "soup", img2: "starters"),
        CategoryRowData(cate1: "American", cate2: "Asian", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "american", img2: "asian"),
        CategoryRowData(cate1: "British", cate2: "Caribbean", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "british", img2: "caribbean"),
        CategoryRowData(cate1: "Central Europe", cate2: "Chinese", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "centralEurope", img2: "chinese"),
        CategoryRowData(cate1: "Eastern Europe", cate2: "French", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "easternEurope", img2: "french"),
        CategoryRowData(cate1: "Indian", cate2: "Italian", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "indian", img2: "italian"),
        CategoryRowData(cate1: "Japanese", cate2: "Kosher", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "japanese", img2: "kosher"),
        CategoryRowData(cate1: "Mediterranean", cate2: "Mexican", color1: Color(red: 123/255, green: 213/255, blue: 186/255), color2: Color(red: 242/255, green: 203/255, blue: 145/255), img1: "mediterranean", img2: "mexican"),
        CategoryRowData(cate1: "Middle Eastern", cate2: "Nordic", color1: Color(red: 253/255, green: 228/255, blue: 151/255), color2: Color(red: 189/255, green: 232/255, blue: 254/255), img1: "middleEastern", img2: "nordic"),
        CategoryRowData(cate1: "South American", cate2: "South East Asian", color1: Color(red: 247/255, green: 165/255, blue: 148/255), color2: Color(red: 188/255, green: 157/255, blue: 200/255), img1: "southAmerican", img2: "southEastAsian"),
    ]
    
    var body: some View {
        VStack {
            
            TitleBar(gr: gr)
            
            SearchBar(gr: gr, query: $query)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    ForEach(self.categories, id: \.self){ item in
                        CategoryRow(gr: self.gr, cate1: item.cate1, cate2: item.cate2, color1: item.color1, color2: item.color2, img1: item.img1, img2: item.img2)
                    }
                    
                }.padding(.bottom)
            }
            
        }.padding([.top, .leading, .trailing])
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
