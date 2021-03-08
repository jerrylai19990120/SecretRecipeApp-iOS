//
//  CustomTopTabBar.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CustomTopTabBar: View {
    
    var gr: GeometryProxy
    
    @Binding var selection: Int
    
    var activeColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var inactiveColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    self.selection = -1
                }) {
                    Text("Introduction")
                        .foregroundColor(selection == -1 ? activeColor : inactiveColor)
                }
                
                Spacer()
                
                Button(action: {
                    self.selection = 0
                }) {
                    Text("Ingredients")
                        .foregroundColor(selection == 0 ? activeColor : inactiveColor)
                }
                
                Spacer()
                
                Button(action: {
                    self.selection = 1
                }) {
                    Text("Nutrition")
                        .foregroundColor(selection == 1 ? activeColor : inactiveColor)
                }
                
                Spacer()
            }
            
            Rectangle()
                .fill(activeColor)
                .frame(width: 20, height:1)
                .offset(x: gr.size.width*0.31*CGFloat(self.selection))
                .animation(.default)
            
        }
        
    }
}

struct CustomTopTabBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CustomTopTabBar(gr: gr, selection: .constant(-1), recipe: Recipe(title: "", img: "", calories: 0, totalWeight: 0, dietLabels: [], healthLabel: [], ingredients: [], isFavorite: false, servings: 0))
        }
    }
}
