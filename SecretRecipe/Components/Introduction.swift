//
//  Introduction.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Introduction: View {
    
    var gr: GeometryProxy
    
    var subTextColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var mainTextColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var title = "Chicken Alfredo"
    
    var intro = "This is my go-to chili recipe for everything from Frito pies to chili fries.  It can be left very basic or made more interesting with additions like chopped onions, kidney and pinto beans, and cans of diced tomatoes and chilies. "
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(mainTextColor)
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .padding(.bottom)
            
                Text(intro)
                    .foregroundColor(self.subTextColor)
                
                Divider().padding([.top, .bottom])
            }.padding()
        }.frame(width: gr.size.width)
        .background(Color(red: 243/255, green: 245/255, blue: 249/255))
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Introduction(gr: gr)
        }
    }
}
