//
//  FavoriteView.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("My Favorites")
                    .font(.custom("Chalkboard SE", size: gr.size.width*0.05))
                Spacer()
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            FavoriteView(gr: gr)
        }
    }
}
