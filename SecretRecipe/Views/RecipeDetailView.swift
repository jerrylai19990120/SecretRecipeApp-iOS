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
    
    @State var popup = false
    
    var body: some View {
        ZStack {
            //Color(red: 243/255, green: 245/255, blue: 249/255)
            VStack {
                
                Image("sample1")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: gr.size.width, height: gr.size.height*0.5)
                    .onTapGesture {
                        self.popup.toggle()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 248/255, green: 251/255, blue: 254/255))
                        .frame(height: gr.size.height*0.6)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.4)
                        
                    
                    DetailComponent(gr: gr).padding(.top, 40)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.18)
                        
                }.animation(.default)
                
                

            }
            
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
