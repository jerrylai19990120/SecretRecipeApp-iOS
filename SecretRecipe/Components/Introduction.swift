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
    
    var body: some View {
        Text("Intro")
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            Introduction(gr: gr)
        }
    }
}
