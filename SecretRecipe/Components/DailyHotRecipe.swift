//
//  DailyHotRecipe.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DailyHotRecipe: View {
    
    var gr: GeometryProxy
    
    var title = "No info"
    
    var desc = "No info"
    
    var img = ""
    
    @State var customImg: UIImage = UIImage(named: "logo")!
    
    var body: some View {
        
        HStack {
            Image(uiImage: customImg)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: gr.size.width*0.28, height: gr.size.width*0.28)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(self.title)
                    .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 64/255, green: 63/255, blue: 83/255))
                    .frame(height: gr.size.height*0.09)
                
                Text(self.desc)
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.042, weight: .medium, design: .rounded))
                    .frame(height: gr.size.height*0.06)
                    .padding([.bottom, .trailing])
                    .padding(.top, 2)
            }
            Spacer()
        }.onAppear {
            self.loadImage(imgUrl: self.img) { (success) in
                
            }
        }.frame(width: gr.size.width*0.88)
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

struct DailyHotRecipe_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DailyHotRecipe(gr: gr)
        }
    }
}
