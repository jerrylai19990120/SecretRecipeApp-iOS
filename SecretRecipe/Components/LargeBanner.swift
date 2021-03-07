//
//  LargeBanner.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct LargeBanner: View {
    
    var gr: GeometryProxy
    
    var img = "sample1"
    
    var title = "Delicious Healthy Pasta"
    
    var description = "Quick & Easy"
    
    var calories = 546
    
    var weight = 544
    
    var serving = 2
    
    @State var customImg: UIImage = UIImage(named: "logo")!
    
    var body: some View {
        ZStack {
            Image(uiImage: self.customImg).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.88, height: gr.size.height*0.3)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text(title)
                    .font(.system(size: gr.size.width*0.043, weight: .medium, design: .rounded))
                Text(description)
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.043, weight: .medium, design: .rounded))
                Rectangle().fill(Color.gray).frame(width: gr.size.width*0.69, height: 1)
                    .padding([.top, .bottom],4)
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(calories) kCal")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text("\(weight) g")
                    }
                    HStack {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.orange)
                        Text("\(serving) servings")
                    }
                }
            }.padding()
            .padding([.leading, .trailing])
            .background(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.96))
            .cornerRadius(20)
            .shadow(radius: 3)
                .offset(y: gr.size.height*0.15)
            
            
                
            
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

struct LargeBanner_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            LargeBanner(gr: gr)
        }
        
    }
}
