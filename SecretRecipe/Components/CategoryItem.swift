//
//  CategoryItem.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    
    var gr: GeometryProxy
    
    var color: Color = Color(red: 253/255, green: 228/255, blue: 151/255)
    
    var img = "steak"
    
    var category = "Quickly"
    
    var body: some View {
        VStack {
            Image(img).resizable()
                .renderingMode(.original)
                .frame(width: gr.size.width*0.20, height: gr.size.width*0.20)
            Text(category)
                .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                .fontWeight(.thin)
            
        }.padding()
        .frame(width: gr.size.width*0.4, height: gr.size.width*0.35)
            .background(color)
        .cornerRadius(20)
        .shadow(radius: 3)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CategoryItem(gr: gr)
        }
    }
}
