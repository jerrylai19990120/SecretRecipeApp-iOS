//
//  FavoriteItem.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct FavoriteItem: View {
    
    var gr: GeometryProxy
    
    var title = "No info"
    
    var desc = "No info"
    
    var img = "sample1"
    
    var calories = 46
    
    var weight = 160
    
    var servings = 6
    
    @State var customImg: UIImage = UIImage(named: "logo")!
    
    var body: some View {
        VStack(spacing: 16) {
            Image(uiImage: customImg)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.92, height: gr.size.height*0.3)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                
                Text(desc)
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(calories) kCal")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text("\(weight) g")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.orange)
                        Text("\(servings) servings")
                    }
                }.padding([.leading, .trailing])
                .frame(width: gr.size.width*0.92)
                
            }.padding([.leading, .trailing])
            .frame(width: gr.size.width*0.92)
            
        }.onAppear {
            self.loadImage(imgUrl: self.img) { (success) in
                
            }
        }
        
    }
    
    func loadImage(imgUrl: String, completion: @escaping (_ status: Bool)->()) {
        
        let urlString = imgUrl.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: urlString) else {
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

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            FavoriteItem(gr: gr)
        }
        
    }
}
