//
//  Preparations.swift
//  SecretRecipe
//
//  Created by Jerry Lai on 2021-03-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct Preparations: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        Text("Prep page")
    }
}

struct Preparations_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Preparations(gr: gr)
        }
    }
}
