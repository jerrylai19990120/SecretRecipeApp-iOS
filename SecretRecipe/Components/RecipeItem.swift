//
//  RecipeItem.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import UIKit

struct RecipeItem: View {
    
    var gr: GeometryProxy
    
    var img = "example"
    
    var title = "Wellington Steakr"
    
    var calories = "160"
    
    @State var customImg: UIImage = UIImage(named: "logo")!
    
    init(gr: GeometryProxy, img: String, title: String, calories: String) {
        self.gr = gr
        self.img = img
        self.title = title
        self.calories = calories
    }
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text(title)
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.046))
                            .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                        
                        Spacer()
                        
                        Text("Calories:")
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.046))
                            .foregroundColor(.gray)
                        Text("\(calories) kCal")
                            .font(.custom("Chalkboard SE", size: gr.size.width*0.046))
                            .foregroundColor(.green)
                    }
                    Spacer()
                }.frame(width: gr.size.width*0.4)
                
                
            }.padding()
            .frame(width: gr.size.width*0.8, height: gr.size.height*0.20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init(white: 0.8), lineWidth: 1))
            
            Image(uiImage: self.customImg)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.3, height: gr.size.height*0.23)
                .clipped()
                .offset(x: -gr.size.width*0.28)
                .shadow(radius: 6)
            
        }.onAppear {
            self.loadImage(imgUrl: self.img) { (success) in
                
            }
        }
    }
    
    func loadImage(imgUrl: String, completion: @escaping (_ status: Bool)->()) {
        
        guard let url = URL(string: imgUrl) else {
            completion(false)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data else {
                completion(false)
                return
            }
            
            DispatchQueue.main.async {
                guard let img = UIImage(data: data) else {
                    completion(false)
                    return
                }
                self.customImg = img
                completion(true)
            }
        }
               
        task.resume()

    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            RecipeItem(gr: gr, img: "example", title: "food", calories: "540")
        }
        
    }
}
