//
//  Ingredients.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Ingredients: View {
    
    var gr: GeometryProxy
    
    var subTextColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var mainTextColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var title = "Chicken Alfredo"
    
    var ingredients = [
        "2 garlic cloves",
        "1 teaspoon ground oregano",
        "1 tablespoon ground cumin",
        "¼ teaspoon cayenne pepper (optional)",
        "2 tablespoons chili powder",
        "2 pounds ground beef",
        "One 8-ounce can tomato sauce",
        "1 teaspoon salt",
        "¼ cup masa (corn flour, found in Mexican food section of many supermarkets)"
        ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: gr.size.height*0.012) {
                Text("For \(title)")
                    .foregroundColor(mainTextColor)
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .padding(.bottom)
                ForEach(self.ingredients, id: \.self){ item in
                    Text("•\(item)")
                        .foregroundColor(self.subTextColor)
                }
                
                Divider().padding([.top, .bottom])
                
            }.padding()
            
        }.padding(.bottom, gr.size.height*0.4)
        .frame(width: gr.size.width)
        .background(Color(red: 243/255, green: 245/255, blue: 249/255))
        
    }
}

struct Ingredients_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Ingredients(gr: gr)
        }
    }
}
