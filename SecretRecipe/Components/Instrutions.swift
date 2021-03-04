//
//  Instructions.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Instrutions: View {
    
    var gr: GeometryProxy
    
    var subTextColor = Color(red: 124/255, green: 150/255, blue: 164/255)
    
    var mainTextColor = Color(red: 97/255, green: 106/255, blue: 140/255)
    
    var steps = [
        "Begin by measuring the spices: chopped garlic, oregano, cumin, cayenne, and chili powder.",
        "Place the ground beef in a large pot and throw in the garlic. Cook the beef until brown",
        "And unless you want to tick off your cardiologist, drain off the excess fat.",
        "Pour in the tomato sauce. Followed by the spices and the salt",
        "Stir together well, cover, and reduce the heat to low. Cover the pot and simmer for 1 hour, stirring occasionally. If the mixture becomes overly dry, add in ½ cup water at a time as needed.",
        "After an hour, place the masa in a small bowl. Add ½ cup water and stir together with a fork.",
        "Dump the masa mixture into the chili.",
        "Stir together well. Taste, adjust the seasonings, and add more masa paste and/or water to get the chili to your preferred consistency, or to add more corn flavor. Add the beans, jalapeño, and tomatoes if desired. Simmer for 10 minutes.",
        "Serve with shredded cheddar, chopped onion, and Fritos."
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: gr.size.height*0.023) {
                Text("Follow the steps below:")
                    .foregroundColor(mainTextColor)
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .padding(.bottom)
                
                ForEach(self.steps, id: \.self){ step in
                    Text("• \(step)")
                        .foregroundColor(self.subTextColor)
                }
                
                Divider().padding([.top, .bottom])
                
            }.padding()
        }.padding(.bottom, gr.size.height*0.4)
        .frame(width: gr.size.width)
        .background(Color(red: 243/255, green: 245/255, blue: 249/255))
    }
}

struct Preparations_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Instrutions(gr: gr)
        }
    }
}
