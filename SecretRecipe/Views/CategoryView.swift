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
    
    @State var popup = false
    
    @State var selection: Int?
    
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
                    if DataService.instance.categoryRecipes.count == 0 {
                        Text("No recipes available at the moment")
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                            .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                        
                        Image("logo")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gr.size.width*0.54, height: gr.size.width*0.54)
                    } else {
                        ForEach(0..<DataService.instance.categoryRecipes.count, id: \.self) {
                            i in
                            
                            NavigationLink(destination: RecipeDetailView(gr: self.gr, recipe: DataService.instance.categoryRecipes[i], popup: self.$popup).navigationBarTitle("").navigationBarHidden(true), tag: i, selection: self.$selection) {
                                Button(action: {
                                    self.selection = i
                                    self.popup.toggle()
                                }) {
                                    
                                    RecipeItem(gr: self.gr, img: DataService.instance.categoryRecipes[i].img, title: DataService.instance.categoryRecipes[i].title, calories: "\(DataService.instance.categoryRecipes[i].calories)")
                                }
                            }
                            
                        }
                    }
                    
                    
                }
            }.frame(width: gr.size.width)
            .padding([.top, .bottom])
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
