//
//  CategoryView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-04.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    
    var gr: GeometryProxy
    
    var category = "Quickly"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
                NavigationLink(destination: TabNavView(selectionIndex: 3).navigationBarTitle("").navigationBarHidden(true)) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                }
                Spacer()
                Text("\(category)")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                Spacer()
            }.padding()
            
            Divider().padding([.leading, .trailing])
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    RecipeItem(gr: gr, img: "1")
                    RecipeItem(gr: gr, img: "2")
                    RecipeItem(gr: gr, img: "3")
                    RecipeItem(gr: gr, img: "4")
                    RecipeItem(gr: gr, img: "5")
                    RecipeItem(gr: gr, img: "6")
                }
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CategoryView(gr: gr)
        }
    }
}
