//
//  TabNavView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-01.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
    
    @State var selectionIndex = 0
    
    var body: some View {
        GeometryReader {
            gr in
            NavigationView {
                ZStack {
                    
                    if self.selectionIndex == 0 {
                        HomeView(gr: gr)
                    }
                    
                    if self.selectionIndex == 1 {
                        RecipeView(gr: gr)
                    }
                    if self.selectionIndex == 2 {
                        FavoriteView(gr: gr)
                    }
                    if self.selectionIndex == 3 {
                        SearchView(gr: gr)
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(gr: gr, selectionIndex: self.$selectionIndex)
                    }.frame(height: gr.size.height)
                    
                    
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
                
                

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}

struct CustomTabBar: View {
    
    var gr: GeometryProxy
    
    @Binding var selectionIndex: Int
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                self.selectionIndex = 0
            }) {
                VStack {
                    Image(systemName: "star")
                        .font(.system(size: gr.size.width*0.06, weight: .bold))
                        .foregroundColor(self.selectionIndex==0 ? .black : .init(white: 0.8))
                    if self.selectionIndex == 0 {
                        Circle().frame(width: gr.size.width*0.016, height: gr.size.width*0.04)
                            .foregroundColor(.black)
                    }
                    
                    
                }
            }
            Spacer()
            Button(action: {
                self.selectionIndex = 1
            }) {
                VStack {
                    Image(systemName: "book")
                        .font(.system(size: gr.size.width*0.06, weight: .bold))
                        .foregroundColor(self.selectionIndex==1 ? .black : .init(white: 0.8))
                    if self.selectionIndex == 1 {
                        Circle().frame(width: gr.size.width*0.016, height: gr.size.width*0.04)
                            .foregroundColor(.black)
                    }
                    
                    
                }
            }
            Spacer()
            Button(action: {
                self.selectionIndex = 2
            }) {
                VStack {
                    Image(systemName: "heart")
                        .font(.system(size: gr.size.width*0.06, weight: .bold))
                        .foregroundColor(self.selectionIndex==2 ? .black : .init(white: 0.8))
                    if self.selectionIndex == 2 {
                        Circle().frame(width: gr.size.width*0.016, height: gr.size.width*0.04)
                            .foregroundColor(.black)
                    }
                    
                    
                }
            }
            Spacer()
            Button(action: {
                self.selectionIndex = 3
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: gr.size.width*0.06, weight: .bold))
                        .foregroundColor(self.selectionIndex==3 ? .black : .init(white: 0.8))
                    
                    if self.selectionIndex == 3 {
                        Circle().frame(width: gr.size.width*0.016, height: gr.size.width*0.04)
                            .foregroundColor(.black)
                    }
                    
                }
            }
            
            
        }.padding()
        .frame(width: gr.size.width, height: gr.size.height*0.1)
            .background(Color.white)
            
    }
}
