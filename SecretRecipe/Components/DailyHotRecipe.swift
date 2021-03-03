//
//  DailyHotRecipe.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DailyHotRecipe: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        HStack {
            Image("sample1")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.28, height: gr.size.width*0.28)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("California Grilled Veggie Sandwich")
                    .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                    .frame(height: gr.size.height*0.09)
                
                Text("Full of great veggies and high-fibre quinoa, this easy-to-make salad is nutritious, delicious and super-satisfying. Top with juicy pomegranate seeds for a great burst of flavour.")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.042, weight: .medium, design: .rounded))
                    .frame(height: gr.size.height*0.06)
                    .padding([.bottom, .trailing])
                    .padding(.top, 2)
            }
        }
    }
}

struct DailyHotRecipe_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DailyHotRecipe(gr: gr)
        }
    }
}
