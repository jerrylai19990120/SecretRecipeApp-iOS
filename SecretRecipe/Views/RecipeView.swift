//
//  RecipeView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    
    @State var query = ""
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack {
            HStack {
                Text("What to eat?")
            }
            
            HStack {
                Image(systemName: "magnifyingglass")
                .font(.system(size: gr.size.width*0.06, weight: .bold))
                    .foregroundColor(.green)
                
                TextField("Search", text: $query)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeView(gr: gr)
        }
        
    }
}
