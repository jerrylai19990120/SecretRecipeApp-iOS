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
            VStack {
                ZStack {
                    
                    if self.selectionIndex == 0 {
                        HomeView()
                    }
                    
                    if self.selectionIndex == 1 {
                        RecipeView()
                    }
                    if self.selectionIndex == 2 {
                        FavoriteView()
                    }
                    if self.selectionIndex == 3 {
                        MoreView()
                    }
                }
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        self.selectionIndex = 0
                    }) {
                        VStack {
                            Image(systemName: "star")
                                .font(.system(size: gr.size.width*0.06, weight: .bold))
                                .foregroundColor(self.selectionIndex==0 ? .black : .init(white: 0.8))
                            
                            Text("Daily")
                                .foregroundColor(self.selectionIndex==0 ? .black : .init(white: 0.8))
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
                            
                            Text("Recipes")
                                .foregroundColor(self.selectionIndex==1 ? .black : .init(white: 0.8))
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
                            
                            Text("Favorite")
                                .foregroundColor(self.selectionIndex==2 ? .black : .init(white: 0.8))
                        }
                    }
                    Spacer()
                    Button(action: {
                        self.selectionIndex = 3
                    }) {
                        VStack {
                            Image(systemName: "ellipsis")
                                .font(.system(size: gr.size.width*0.06, weight: .bold))
                                .foregroundColor(self.selectionIndex==3 ? .black : .init(white: 0.8))
                            
                            Text("More")
                                .foregroundColor(self.selectionIndex==3 ? .black : .init(white: 0.8))
                        }
                    }
                    
                    
                }
            }.padding()

        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
