//
//  ActivityIndicator.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
    
    var gr: GeometryProxy
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        
        ForEach(0..<5) { index in
        Group {
            Circle()
                .frame(width: self.gr.size.width / 5, height: self.gr.size.height / 5)
            .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
                .offset(y: self.gr.size.width / 10 - self.gr.size.height / 2)
        }.frame(width: self.gr.size.width/2, height: self.gr.size.width/2)
            .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
            .animation(Animation
                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                .repeatForever(autoreverses: false))
        }.aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
        .onDisappear {
            self.isAnimating = false
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ActivityIndicator(gr: gr)
        }
        
    }
}
