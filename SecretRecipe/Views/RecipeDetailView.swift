//
//  RecipeDetailView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var gr: GeometryProxy
    
    @State var selection = -1
    
    var body: some View {
        VStack {
            Image("sample1")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(width: gr.size.width, height: gr.size.height*0.5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                DetailComponent(gr: gr)
                
            }.offset(y: -60)
            
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeDetailView(gr: gr)
        }
        
    }
}
