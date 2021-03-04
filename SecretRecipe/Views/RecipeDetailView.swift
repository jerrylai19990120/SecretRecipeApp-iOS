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
    
    @Binding var popup: Bool
    
    @State var isFavorite = false
    
    @State var tag: Int?
    
    var body: some View {
        ZStack {
            //Color(red: 243/255, green: 245/255, blue: 249/255)
            VStack {
                
                ZStack {
                    Image("sample1")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: gr.size.width, height: gr.size.height*0.5)
                    
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: FavoriteView(gr: gr).navigationBarTitle("").navigationBarHidden(true), tag: 1, selection: $tag) {
                                
                                Button(action: {
                                    self.tag = 1
                                    self.popup.toggle()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                        .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                                }
                                
                            }.accentColor(.black)
                            
                                
                            Spacer()
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                                .onTapGesture {
                                    self.isFavorite.toggle()
                            }
                        }.padding(.top, gr.size.height*0.1)
                        
                        Spacer()
                    }.padding()
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 248/255, green: 251/255, blue: 254/255))
                        .frame(height: gr.size.height*0.6)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.4)
                        
                    
                    DetailComponent(gr: gr).padding(.top, 40)
                        .offset(y: !popup ? gr.size.height+88 : -gr.size.height*0.18)
                        
                }.animation(.default)
                
                

            }
            
        }.padding(.top, gr.size.height*0.46)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeDetailView(gr: gr, popup: .constant(true))
        }
        
    }
}
